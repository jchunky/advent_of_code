class Position < Struct.new(:row, :col)
  def next_position(bearing)
    case bearing
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
