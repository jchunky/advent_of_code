require "active_support/all"
require "../../lib/utils"

input = File.read("input.txt").chomp
input = "89010123
78121874
87430965
96549874
45678903
32019012
01329801
10456732"

class Trailhead < Struct.new(:map, :starting_position)
  def score
    trail_count
  end

  private

  def trail_count
    destinations = paths(starting_position, 0)
    destinations.uniq.count
  end

  def paths(position, elevation)
    return position if elevation == 9

    position.orthogonally_adjacent_positions.map { |adjacent_position|
      if map.content_at?(elevation + 1, adjacent_position)
        paths(adjacent_position, elevation + 1)
      end
    }.flatten.compact
  end
end

class Map < Grid
  def initialize(input)
    super(input.split("\n").map { |line| line.chars.map(&:to_i) })
  end

  def trailhead_score_sum
    trailheads.sum(&:score)
  end

  private

  def trailheads
    find_all(0).map { |starting_position| Trailhead.new(self, starting_position) }
  end
end

p Map.new(input).trailhead_score_sum
