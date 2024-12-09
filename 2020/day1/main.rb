require "active_support/all"

lines = File.read("input.txt").split("\n")

p lines.map(&:to_i).combination(2).find { |a, b| a + b == 2020 }.reduce(:*)

p lines.map(&:to_i).combination(3).find { |a, b, c| a + b + c == 2020 }.reduce(:*)
