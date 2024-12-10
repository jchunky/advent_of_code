module Year2019
  module Day4
    class Problem2 < Problem
      def self.test_input
        "100000,112000"
      end

      def self.test_result
        64
      end

      def result
        lower, upper = input.split(",").map(&:to_i)
        range = (lower..upper)

        range.count do |n|
          digits = n.to_s.chars

          digits.dup.prepend(nil).append(nil).each_cons(4).any? do |a, b, c, d|
            a != b && b == c && c != d
          end &&
            (digits == digits.sort)
        end
        # 876
      end
    end
  end
end
