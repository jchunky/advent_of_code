require "active_support/all"

lines = File.read("input.txt").split("\n")

pairs = lines.count { |line| line.chars.tally.value?(2) }
triples = lines.count { |line| line.chars.tally.value?(3) }
p pairs * triples # 8610

candidates =
  lines.combination(2).select do |a, b|
    a.chars.zip(b.chars).count { |a, b|
      a != b
    } == 1
  end

p candidates
