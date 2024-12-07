require "active_support/all"

input = File.readlines("input.txt").map(&:chomp)

input =
  "....#.....
.........#
..........
..#.......
.......#..
..........
.#..^.....
........#.
#.........
......#...
".split("\n")

class Position < Struct.new(:row, :col)
  def next_position(bearing)
    case bearing
    when :north then Position.new(row - 1, col)
    when :east then Position.new(row, col + 1)
    when :south then Position.new(row + 1, col)
    when :west then Position.new(row, col - 1)
    end
  end
end

class Guard < Struct.new(:grid, :position, :directions)
  def initialize(grid, position)
    super(grid, position, %i[north east south west])
  end

  def bearing
    directions.first
  end

  def walk
    while on_grid?
      turn_right while facing_obstacle?
      step
    end
  end

  def on_grid?
    grid.include?(position)
  end

  def turn_right
    directions.rotate!
  end

  def facing_obstacle?
    grid.obstacle_at?(next_position)
  end

  def step
    grid.record_visit(position)
    self.position = next_position
  end

  def next_position
    position.next_position(bearing)
  end
end

class Grid < Struct.new(:rows)
  def visited_position_count
    rows.join.count("X")
  end

  def include?(position)
    (0...rows.size).cover?(position.row) && (0...rows.first.size).cover?(position.col)
  end

  def obstacle_at?(position)
    content_of(position) == "#"
  end

  def content_of(position)
    rows.dig(position.row, position.col)
  end

  def record_visit(position)
    rows[position.row][position.col] = "X"
  end

  def find_guard_position
    0.upto(rows.size - 1).each do |row|
      0.upto(rows.first.size - 1).each do |col|
        return Position.new(row, col) if rows[row][col] == "^"
      end
    end
  end
end

class Map
  attr_reader :grid, :guard

  delegate :visited_position_count, to: :grid

  def initialize(rows)
    @grid = Grid.new(rows)
    @guard = Guard.new(@grid, @grid.find_guard_position)
  end

  delegate :walk, to: :guard
end

rows = input.map(&:chars)
map = Map.new(rows)
map.walk
p map.visited_position_count
