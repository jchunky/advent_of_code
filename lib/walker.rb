class Walker < Struct.new(:grid, :position, :directions, :loop_found, :visits)
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
