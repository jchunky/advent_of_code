require "active_support/all"
require_relative "../../lib/utils"

input = File.readlines("input.txt").map(&:chomp)

# input = "............
# ........0...
# .....0......
# .......0....
# ....0.......
# ......A.....
# ............
# ............
# ........A...
# .........A..
# ............
# ............
# ".split("\n")

# input = "T.........
# ...T......
# .T........
# ..........
# ..........
# ..........
# ..........
# ..........
# ..........
# ..........
# ".split("\n")

class AntennaGrid < Grid
  def antenna_positions_by_frequency
    each_position
      .reject { |position| content_of(position) == "." }
      .group_by { |position| content_of(position) }
  end
end

class AntinodeGrid < Grid
  def initialize(size)
    rows = Array.new(size) { "." * size }
    super(rows)
  end

  def antinode_count
    rows.join.count("#")
  end

  def place_antinode_at(position)
    place_content_at("#", position)
  end
end

class Map
  attr_reader :antennas, :antinodes

  def initialize(rows)
    @antennas = AntennaGrid.new(rows)
    @antinodes = AntinodeGrid.new(rows.size)
  end

  def antinode_count
    antennas.antenna_positions_by_frequency.each do |_frequency, positions|
      record_antinodes(positions)
    end
    antinodes.antinode_count
  end

  private

  def record_antinodes(positions)
    positions.permutation(2).each do |a, b|
      delta = a.delta(b)
      antinode = b + delta
      antinodes.place_antinode_at(antinode)
    end
  end

  def record_antinodes(positions)
    positions.permutation(2).each do |a, b|
      antinodes.place_antinode_at(a)
      antinodes.place_antinode_at(b)
      delta = a.delta(b)
      antinode = b + delta
      while antinodes.include?(antinode)
        antinodes.place_antinode_at(antinode)
        antinode += delta
      end
    end
  end
end

rows = input.map(&:chars)
map = Map.new(rows)
p map.antinode_count # 381, 1184
