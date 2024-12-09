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

    (
      (digits[0] == digits[1] && digits[1] != digits[2]) ||
      (digits[-3] != digits[-2] && digits[-2] == digits[-1]) ||
      digits.count.times.any? { |i| digits[i] != digits[i + 1] && digits[i + 1] == digits[i + 2] && digits[i + 2] != digits[i + 3] }
    ) &&
    digits == digits.sort
  end
) # 876
