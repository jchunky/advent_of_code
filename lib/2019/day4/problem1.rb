module Year2019
  module Day4
    class Problem1 < Problem
      def self.test_input
        "100000,112000"
      end

      def self.test_result
        165
      end

      def result
        lower, upper = input.split(",").map(&:to_i)
        range = (lower..upper)

        range.count do |n|
          digits = n.to_s.chars
          digits.each_cons(2).any? { |a, b| a == b } &&
            digits == digits.sort
        end
      end
    end
  end
end
