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

class Map
  attr_reader :grid, :bearing, :position, :initial_position, :has_cycle, :steps

  def initialize(grid, initial_position = find_guard(grid))
    @grid = grid
    @bearing = %i[north east south west]
    @initial_position = initial_position
    @position = initial_position
    @steps = {}
    @has_cycle = false
  end

  def path_has_cycle?
    walk_path
    has_cycle?
  end

  def has_cycle?
    has_cycle
  end

  def obstacle_at?(coord)
    at_coord(coord) == "#"
  end

  def at_coord(coord)
    grid.dig(coord.row, coord.col)
  end

  def each_coord
    return enum_for(:each_coord) unless block_given?

    (0...grid.size).each do |r|
      (0...grid.first.size).each do |c|
        yield(Coord.new(r, c))
      end
    end
  end

  def build_with_obstacle(coord)
    Map.new(grid.map(&:dup), initial_position)
  end

  private

  def walk_path
    until off_grid? || has_cycle?
      turn_right while obstacle_in_front?
      step
    end
  end

  def off_grid?
    !(0...grid.size).cover?(position.row) ||
      !(0...grid.first.size).cover?(position.col)
  end

  def turn_right
    bearing.rotate!
  end

  def obstacle_in_front?
    obstacle_at?(next_position)
  end

  def step
    @position = next_position
    @has_cycle ||= steps.include?(current_step)
    steps[current_step] = true
  end

  def current_step
    [bearing.first, position.row, position.col].to_s
  end

  def next_position
    position.adjacent_coord(bearing.first)
  end

  def find_guard(grid)
    grid.size.times.each do |r|
      grid.first.size.times.each do |c|
        return Coord.new(r, c) if grid[r][c] == "^"
      end
    end
  end
end

class Main
  def run
    grid = File.readlines("input.txt").map(&:chomp).map(&:chars)
    map = Map.new(grid)
    obstruction_count =
      map
        .each_coord.reject { |coord|
          map.obstacle_at?(coord)
        }
        .count do |coord|
          map.build_with_obstacle(coord).path_has_cycle?
        end
    p obstruction_count
  end
end

Main.new.run
