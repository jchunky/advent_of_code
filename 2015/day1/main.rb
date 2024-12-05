require "active_support/all"

input = File.read("input.txt")
p input.count("(") - input.count(")")

position = 0
input.chars.each.with_index(1) do |char, i|
  case char
  when "("
    position += 1
  when ")"
    position -= 1
  end

  if position == -1
    abort i.to_s
  end
end
