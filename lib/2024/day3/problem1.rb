module Year2024
  module Day3
    class Problem1 < Problem
      def self.test_input
        "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
      end

      def self.test_result
        161
      end

      def result
        input
          .scan(/mul\((\d+),(\d+)\)/)
          .map { |a| a.map(&:to_i) }
          .sum { |a, b| a * b }
      end
    end
  end
end
