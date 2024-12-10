require "active_support/all"
require_relative "../../lib/utils"

input = File.readlines("input.txt").map(&:chomp)

# input =
#   "....#.....
# .........#
# ..........
# ..#.......
# .......#..
# ..........
# .#..^.....
# ........#.
# #.........
# ......#...
# ".split("\n")

class Guard < Walker
  def initialize(grid, position)
    super(grid, position)
  end

  def walk
    while on_grid?
      turn_right while facing_obstacle?
      step
    end
  end

  def record_visit
    visit = [position.row, position.col].to_s
    visits[visit] = true
  end

  private

  def facing_obstacle?
    facing_content?("#")
  end
end

class MyGrid < Grid
  def find_guard
    find_content("^")
  end
end

class Map
  attr_reader :grid, :guard

  delegate :visit_count, to: :guard
  delegate :walk, to: :guard

  def initialize(rows)
    @grid = MyGrid.new(rows)
    @guard = Guard.new(@grid, @grid.find_guard)
  end
end

rows = input.map(&:chars)
map = Map.new(rows)
map.walk
p map.visit_count # 5162
