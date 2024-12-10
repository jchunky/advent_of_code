class Walker < Struct.new(:grid, :position, :directions, :loop_found, :visits)
  def initialize(grid, position, directions = %i[north east south west])
    super(grid, position, directions, false, {})
  end

  def facing_content?(content)
    grid.content_at?(content, next_position)
  end

  def turn_right
    directions.rotate!
  end

  def step
    record_visit
    self.position = next_position
  end

  def record_visit
    visit = [position.row, position.col, bearing].to_s
    self.loop_found = true if visits.include?(visit)
    visits[visit] = true
  end

  def next_position
    position.next_position(bearing)
  end

  def bearing
    directions.first
  end

  def visit_count
    visits.count
  end

  def in_loop?
    loop_found
  end

  def on_grid?
    grid.include?(position)
  end
end
