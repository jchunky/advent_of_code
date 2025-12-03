module Year2025
  module Day2
    class Problem1 < Problem
      def self.test_input
        "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124
"
      end

      def self.test_result
        1227775554
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
        return false if s.length.odd?

        half_length = s.length / 2
        first_half = s[0, half_length]
        second_half = s[(half_length)..]

        first_half == second_half
      end
    end
  end
end
