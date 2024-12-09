require "active_support/all"

lines = File.read("input.txt").split("\n")

p(lines.map(&:to_i).sum { |mass| (mass / 3) - 2 })
