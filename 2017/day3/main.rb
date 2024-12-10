require "active_support/all"
require_relative "../../lib/utils"

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

vector = Vector.new
grid = Grid.new
(1..).each do |index|
  sum = index == 1 ? 1 : vector.position.adjacent_positions.sum { |p| grid.content_of(p) }
  abort(sum.to_s) if sum > square_index # 312453
  grid.place_content_at(vector.position, sum)
  vector.turn_left unless grid.include?(vector.left_position)
  vector.step
end
