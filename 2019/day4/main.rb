require "active_support/all"

input = (231832..767346)

p(
  input.count do |n|
    digits = n.to_s.chars
    digits.each_cons(2).any? { |a, b| a == b } &&
    digits == digits.sort
  end
) # 1330

p(
  input.count do |n|
    digits = n.to_s.chars

    digits.dup.prepend(nil).append(nil).each_cons(4).any? do |a, b, c, d|
      a != b && b == c && c != d
    end &&
    (digits == digits.sort)
  end
) # 876
