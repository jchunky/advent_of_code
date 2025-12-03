module Year2025
  module Day2
    class Problem2 < Problem
      def self.test_input
        "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124
"
      end

      def self.test_result
        4174379265
      end

      def result
        sum = 0
        lines.first.split(",").each do |range|
          lower, upper = (range.include?("-") ? range.split("-") : [range, range])
          lower = lower.to_i
          upper = upper.to_i
          (lower..upper).each do |n|
            sum += n if invalid?(n)
          end
        end
        sum
      end

      def invalid?(n)
        s = n.to_s
        length = s.length

        (1..length / 2).each do |i|
          next unless divisible_by?(length, i)
          quotient = length / i

          return true if (s.first(i) * quotient) == s
        end

        false
      end

      def divisible_by?(x, y)
          x % y == 0
      end
    end
  end
end
