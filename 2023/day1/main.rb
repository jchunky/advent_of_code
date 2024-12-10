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

DIGITS = {
  "one" => 1,
  "two" => 2,
  "three" => 3,
  "four" => 4,
  "five" => 5,
  "six" => 6,
  "seven" => 7,
  "eight" => 8,
  "nine" => 9,
  "1" => 1,
  "2" => 2,
  "3" => 3,
  "4" => 4,
  "5" => 5,
  "6" => 6,
  "7" => 7,
  "8" => 8,
  "9" => 9,
}

p(
  input.split("\n").sum do |line|
    _index, left_digit =
      DIGITS
            .transform_keys { |word| line.index(word) }
            .select { |index, value| index }
            .min_by { |index, value| index }

    _index, right_digit =
      DIGITS
            .transform_keys { |word| line.rindex(word) }
            .select { |index, value| index }
            .max_by { |index, value| index }

    [left_digit, right_digit].join.to_i
  end
)
