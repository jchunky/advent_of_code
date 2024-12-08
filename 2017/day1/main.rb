require "active_support/all"

input = File.read("input.txt").chomp

p(
  input.length.times
    .select { |i| input[i] == input[(i + 1) % input.length] }
    .sum { |i| input[i].to_i }
) # 1089
