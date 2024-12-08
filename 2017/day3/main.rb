require "active_support/all"

class Position < Struct.new(:row, :col)
  def move(direction)
    case direction
    when :north then Position.new(row - 1, col)
    when :east then Position.new(row, col + 1)
    when :south then Position.new(row + 1, col)
    when :west then Position.new(row, col - 1)
    end
  end
end

class Grid
  attr_reader :positions

  delegate :include?, to: :positions

  def initialize
    @positions = {}
  end

  def content_of(position)
    positions[position] || 0
  end

  def place_content_at(position, content)
    positions[position] = content
  end
end

class Vector < Struct.new(:position, :directions)
  def initialize(position = Position.new(0, 0), directions = %i[south east north west])
    super
  end

  def left_position
    dup.turn_left.step
  end

  def turn_left
    directions.rotate!
    self
  end

  def step
    self.position = position.move(direction)
  end

  def dup
    Vector.new(position.dup, directions.dup)
  end

  def direction
    directions.first
  end
end

square_index = 312051
# square_index = 1024

vector = Vector.new
grid = Grid.new
(1..square_index - 1).each do |index|
  grid.place_content_at(vector.position, index)
  vector.turn_left unless grid.include?(vector.left_position)
  vector.step
end
p [vector.position.row, vector.position.col].sum(&:abs) # 31, 430
