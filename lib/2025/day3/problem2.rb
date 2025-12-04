module Year2025
  module Day3
    class Problem2 < Problem
      def self.test_input
        "987654321111111
811111111111119
234234234234278
818181911112111
"
      end

      def self.test_result
        3121910778619
      end

      def result
        lines.sum do |line|
          digits = line.chars.map(&:to_i)
          left_index = 0
          right_index = line.length - 12
          result = []
          while result.length < 12
            candidates = digits[left_index..right_index]
            next_digit = candidates.max
            next_digit_index = candidates.index(next_digit) + left_index
            result << next_digit
            left_index = next_digit_index + 1
            right_index += 1
          end
          result.join.to_i
        end
      end
    end
  end
end
