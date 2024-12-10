module Year2019
  module Day4
    class Problem1 < Problem
      def self.test_result
        1330
      end

      def result
        input = (231832..767346)

        input.count do |n|
          digits = n.to_s.chars
          digits.each_cons(2).any? { |a, b| a == b } &&
            digits == digits.sort
        end
      end
    end
  end
end
