require "active_support/all"

class Coord < Struct.new(:row, :col)
  def adjacent_coord(direction)
    case direction
    when :north then Coord.new(row - 1, col)
    when :east then Coord.new(row, col + 1)
    when :south then Coord.new(row + 1, col)
    when :west then Coord.new(row, col - 1)
    end
  end
end

class Main
  attr_reader :grid, :bearing, :position

  def initialize
    @grid = File.readlines("input.txt").map(&:chomp).map(&:chars)
    @bearing = %i[north east south west]
    @position = find_guard
  end

  def run
    walk_path
    p grid.flatten.count("X")
  end

  private

  def walk_path
    until off_grid?
      mark_current_position
      turn_right while obstacle_in_front?
      step
    end
  end

  def off_grid?
    !(0...grid.size).cover?(position[0]) ||
      !(0...grid.first.size).cover?(position[1])
  end

  def mark_current_position
    grid[position.row][position.col] = "X"
  end

  def turn_right
    bearing.rotate!
  end

  def obstacle_in_front?
    at_coord(next_position) == "#"
  end

  def step
    @position = next_position
  end

  def next_position
    position.adjacent_coord(bearing.first)
  end

  def find_guard
    grid.size.times.each do |r|
      grid.first.size.times.each do |c|
        return Coord.new(r, c) if grid[r][c] == "^"
      end
    end
  end

  def at_coord(coord)
    grid.dig(coord.row, coord.col)
  end
end

Main.new.run
