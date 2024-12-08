require "active_support/all"

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

class Position < Struct.new(:row, :col)
  def antinode(other)
    row_delta = other.row - row
    col_delta = other.col - col
    Position.new(other.row + row_delta, other.col + col_delta)
  end

  def delta(other)
    Position.new(other.row - row, other.col - col)
  end

  def +(delta)
    Position.new(row + delta.row, col + delta.col)
  end
end

class Grid < Struct.new(:rows)
  def each_position
    return enum_for(:each_position) unless block_given?

    0.upto(rows.size - 1).each do |row|
      0.upto(rows.first.size - 1).each do |col|
        yield Position.new(row, col)
      end
    end
  end

  def content_of(position)
    return unless include?(position)

    rows.dig(position.row, position.col)
  end

  def include?(position)
    (0...rows.size).cover?(position.row) && (0...rows.first.size).cover?(position.col)
  end
end

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
    return unless include?(position)

    rows[position.row][position.col] = "#"
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
      antinodes.place_antinode_at(a.antinode(b))
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
