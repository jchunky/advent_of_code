require "active_support/all"

input = File.read("input.txt")

p input.split("\n\n").map { |elf| elf.split("\n").sum(&:to_i) }.max # 71471

p input.split("\n\n").map { |elf| elf.split("\n").sum(&:to_i) }.max(3).sum # 211189
