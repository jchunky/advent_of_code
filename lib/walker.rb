class Walker < Struct.new(:grid, :position, :directions, :loop_found, :visits)
  def initialize(grid, position, directions = %i[north east south west])
    super(grid, position, directions, false, {})
  end

  def in_loop?
    loop_found
  end

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

  def facing_content?(content)
    grid.content_at?(content, next_position)
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
