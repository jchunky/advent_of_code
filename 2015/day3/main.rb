require "active_support/all"

input = File.read("input.txt").chars

position = [0, 0]
visits = Hash.new(0)
visits[position.to_s] += 1
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
  visits[position.to_s] += 1
end
p visits.keys.count # 2081

santa_position = [0, 0]
robo_position = [0, 0]
visits = Hash.new(0)
visits[santa_position.to_s] += 1
visits[robo_position.to_s] += 1
input.each.with_index(1) do |c, i|
  position = i.odd? ? santa_position : robo_position
  case c
  when "^" then position[0] += 1
  when "v" then position[0] -= 1
  when ">" then position[1] += 1
  when "<" then position[1] -= 1
  end
  visits[position.to_s] += 1
end
p visits.keys.count # 2341
