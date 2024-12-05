require "active_support/all"

def required_wrapping_paper(line)
  a, b, c = line.split("x").map(&:to_i).sort
  (a * b) + (2 * ((a * b) + (b * c) + (c * a)))
end

lines = File.readlines("input.txt")
p(lines.sum { |l| required_wrapping_paper(l) })
