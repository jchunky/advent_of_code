module Year2020
  module Day1
    class Problem1 < Problem
      def self.test_input
        "1721
979
366
299
675
1456"
      end

      def self.test_result
        514579
      end

      def result
        lines.map(&:to_i).combination(2).find { |a, b| a + b == 2020 }.reduce(:*)
      end
    end
  end
end
