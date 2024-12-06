require "active_support/all"

instructions = File.read("input.txt").chomp

bearing = %i[north east south west]
position = [0, 0]
instructions.split(", ").each do |instruction|
  turn, *steps = instruction.chars
  steps = steps.join.to_i
  case turn
  when "L" then bearing.rotate!(-1)
  when "R" then bearing.rotate!(+1)
  end
  case bearing.first
  when :north then position[0] += steps
  when :east then position[1] += steps
  when :south then position[0] -= steps
  when :west then position[1] -= steps
  end
end
p position.sum(&:abs)

def take_steps(visits, position, bearing, steps)
  case bearing.first
  when :north
    steps.times do
      position[0] += 1
      record_position(visits, position)
    end
  when :east
    steps.times do
      position[1] += 1
      record_position(visits, position)
    end
  when :south
    steps.times do
      position[0] -= 1
      record_position(visits, position)
    end
  when :west
    steps.times do
      position[1] -= 1
      record_position(visits, position)
    end
  end
end

def record_position(visits, position)
  key = position.to_s
  abort(position.sum(&:abs).to_s) if visits.key?(key)
  visits[key] = true
end

bearing = %i[north east south west]
position = [0, 0]
visits = {}
key = position.to_s
visits[key] = true
instructions.split(", ").each do |instruction|
  turn, *steps = instruction.chars
  steps = steps.join.to_i
  case turn
  when "L" then bearing.rotate!(-1)
  when "R" then bearing.rotate!(+1)
  end
  take_steps(visits, position, bearing, steps)
end
