require "active_support/all"

def required_wrapping_paper(line)
  a, b, c = line.split("x").map(&:to_i).sort
  (a * b) + (2 * ((a * b) + (b * c) + (c * a)))
end

def required_ribbon(line)
  a, b, c = line.split("x").map(&:to_i).sort
  (2 * (a + b)) + (a * b * c)
end

lines = File.readlines("input.txt")

p(lines.sum { |l| required_wrapping_paper(l) })

p(lines.sum { |l| required_ribbon(l) })
