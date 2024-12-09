require "active_support/all"

lines = File.read("input.txt")

p eval(lines.delete("\n")) # 587

frequency = 0
seen = {}
lines.split("\n").map(&:to_i).cycle.each do |delta|
  frequency += delta
  abort(frequency.to_s) if seen.include?(frequency)
  seen[frequency] = true
end
