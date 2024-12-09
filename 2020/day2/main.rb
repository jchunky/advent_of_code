require "active_support/all"

lines = File.read("input.txt").split("\n")

# lines = "1-3 a: abcde
# 1-3 b: cdefg
# 2-9 c: ccccccccc
# ".split("\n")

p(
  lines.count do |line|
    lower, upper, letter, _, password = line.split(/\W/)
    (lower.to_i..upper.to_i).cover?(password.chars.tally[letter])
  end
)

p(
  lines.count do |line|
    lower, upper, letter, _, password = line.split(/\W/)
    a = password[lower.to_i - 1]
    b = password[upper.to_i - 1]
    a != b && [a, b].include?(letter)
  end
)
