require "active_support/all"

lines = File.read("input.txt")

p eval(lines.delete("\n"))
