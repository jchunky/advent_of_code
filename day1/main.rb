require "active_support/all"

first, second = File.read("input.txt").lines.map(&:split).transpose
first, second = [first, second].map { |e| e.map(&:to_i) }.map(&:sort)

p(first.zip(second).sum { |a, b| (a - b).abs })

p(first.sum { |n| n * second.count(n) })
