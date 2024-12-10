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
    0
  end
end

class Map < Grid
  def initialize(input)
    super(input.split("\n").map { |line| line.chars.map(&:to_i) })
  end

  def trailhead_score_sum
    trailheads.sum(&:score)
  end

  def trailheads
    find_all(0).map { |starting_position| Trailhead.new(self, starting_position) }
  end
end

p Map.new(input).trailhead_score_sum
