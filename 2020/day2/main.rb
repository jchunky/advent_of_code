require "active_support/all"

lines = File.read("input.txt").split("\n")

p(
  lines.count do |line|
    lower, upper, letter, _, password = line.split(/\W/)
    (lower.to_i..upper.to_i).cover?(password.chars.tally[letter])
  end
)
