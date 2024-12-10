class Position < Struct.new(:row, :col)
  def move(direction)
    case direction
    when :north then Position.new(row - 1, col)
    when :east then Position.new(row, col + 1)
    when :south then Position.new(row + 1, col)
    when :west then Position.new(row, col - 1)
    end
  end

  def adjacent_positions
    [-1, 0, 1].product([-1, 0, 1]).reject { |e| e == [0, 0] }.map { |r, c| Position.new(row + r, col + c) }
  end

  def delta(other)
    Position.new(other.row - row, other.col - col)
  end

  def +(delta)
    Position.new(row + delta.row, col + delta.col)
  end
end

class SparseGrid < Struct.new(:positions)
  delegate :include?, to: :positions

  def initialize
    super({})
  end

  def content_of(position)
    positions[position] || 0
  end

  def place_content_at(position, content)
    positions[position] = content
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

  def place_content_at(position, content)
    return unless include?(position)

    rows[position.row][position.col] = content
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

