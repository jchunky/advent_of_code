require "active_support/all"

input = File.read("input.txt").chomp

input += input[0]
p input.chars.each_cons(2).select { |a, b| a == b }.map(&:first).sum(&:to_i) # 1089
