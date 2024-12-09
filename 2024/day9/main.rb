require "active_support/all"

input = File.read("input.txt")
input = "2333133121414131402"

# 00...111...2...333.44.5555.6666.777.888899

array =
  input.chars.flat_map.with_index do |char, i|
    if i.even?
      [i / 2] * char.to_i
    else
      ["."] * char.to_i
    end
  end

p array
