require "active_support/all"

input = File.read("input.txt")

p(
  input.split("\n").sum do |line|
    find_two_digits = line.scan(/^[a-z]*(\d).*(\d)[a-z]*$/).join
    find_one_digit = line.scan(/^[a-z]*(\d)/).join
    digits = find_two_digits == "" ? find_one_digit * 2 : find_two_digits
    digits.to_i
  end
)
