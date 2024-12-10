require "active_support/all"

input = File.read("input.txt")
lines = input.split("\n")

p(lines.map(&:to_i).each_cons(2).count { |a, b| a < b }) # 1715
