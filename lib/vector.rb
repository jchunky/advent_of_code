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
    self.position = position.next_position(bearing)
  end

  def dup
    Vector.new(position.dup, directions.dup)
  end

  def bearing
    directions.first
  end
end
