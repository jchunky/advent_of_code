module Year2025
  module Day3
    class Problem1 < Problem
      def self.test_input
        "987654321111111
811111111111119
234234234234278
818181911112111
"
      end

      def self.test_result
        357
      end

      def result
        lines.sum do |line|
          digits = line.chars.map(&:to_i)
          first_digit = digits[0..-2].max
          first_index = digits.index(first_digit)
          second_digit = digits[(first_index + 1)..].max

          first_digit * 10 + second_digit
        end
      end
    end
  end
end
