require "active_support/all"
# require_relative "../../lib/utils"

input = File.readlines("input.txt").map(&:chomp)

input = "....#.....
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

class Guard < Struct.new(:grid, :position, :directions, :loop_found, :visits)
  def initialize(grid, position)
    super(grid, position, %i[north east south west], false, {})
  end

  def walk
    while on_grid? && !in_loop?
      record_visit
      turn_right while facing_obstacle?
      step while on_grid? && !facing_obstacle?
    end
  end

  def in_loop?
    loop_found
  end

  private

  def record_visit
    visit = [position.row, position.col, bearing].to_s
    self.loop_found = true if visits.include?(visit)
    visits[visit] = true
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
    self.position = next_position
  end

  def next_position
    position.next_position(bearing)
  end

  def bearing
    directions.first
  end
end

class Grid < Struct.new(:rows)
  def find_guard_position
    each_position do |position|
      return position if guard_at?(position)
    end
  end

  def include?(position)
    (0...rows.size).cover?(position.row) && (0...rows.first.size).cover?(position.col)
  end

  def obstacle_at?(position)
    content_of(position) == "#"
  end

  def each_variation
    return enum_for(:each_variation) unless block_given?

    each_position do |position|
      next if obstacle_at?(position) || guard_at?(position)

      new_grid = dup
      new_grid.place_obstacle_at(position)
      yield(new_grid)
    end
  end

  def place_obstacle_at(position)
    rows[position.row][position.col] = "#"
  end

  def dup
    Grid.new(rows.map(&:dup))
  end

  private

  def guard_at?(position)
    content_of(position) == "^"
  end

  def content_of(position)
    return unless include?(position)

    rows.dig(position.row, position.col)
  end

  def each_position
    0.upto(rows.size - 1).each do |row|
      0.upto(rows.first.size - 1).each do |col|
        yield Position.new(row, col)
      end
    end
  end
end

class Map
  attr_reader :grid, :starting_guard_position

  def initialize(rows)
    @grid = Grid.new(rows)
    @starting_guard_position = @grid.find_guard_position
  end

  def variations_with_loop_count
    grid.each_variation.with_index.count do |grid, i|
      print "." if i % grid.rows.size == 0
      guard = Guard.new(grid, starting_guard_position)
      guard.walk
      guard.in_loop?
    end
  end
end

rows = input.map(&:chars)
map = Map.new(rows)
p map.variations_with_loop_count # 1909
