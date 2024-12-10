module Year2023
  module Day1
    class Problem2 < Problem
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

      def self.test_input
        "two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
"
      end

      def self.test_result
        281
      end

      def result
        lines.sum do |line|
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
      end
    end
  end
end
