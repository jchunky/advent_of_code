require "active_support/all"

square_index = 312051
# square_index = 1024

direction = %i[east north west south]
index = 1
step_index = 0
step_count = 0
step_target = 1
x = 0
y = 0

while index < square_index
  case direction.first
  when :north then y += 1
  when :east then x += 1
  when :south then y -= 1
  when :west then x -= 1
  end

  step_count += 1
  index += 1
  next unless step_count == step_target

  step_index += 1
  step_count = 0
  step_target += 1 if step_index.even?
  direction.rotate!
end

p [x, y].sum(&:abs)
