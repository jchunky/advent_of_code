require "active_support/all"

input = File.read("input.txt").chars

position = [0, 0]
visits = Hash.new(0)
visits[position] += 1

input.each do |c|
  case c
  when "^"
    position[0] += 1
  when "v"
    position[0] -= 1
  when ">"
    position[1] += 1
  when "<"
    position[1] -= 1
  end

  visits[position] += 1
end

p visits.keys.count
