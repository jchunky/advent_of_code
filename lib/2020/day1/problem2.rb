module Year2020
  module Day1
    class Problem2 < Problem
      def self.test_input
        "1721
979
366
299
675
1456"
      end

      def self.test_result
        241861950
      end

      def result
        lines.map(&:to_i).combination(3).find { |a, b, c| a + b + c == 2020 }.reduce(:*)
      end
    end
  end
end
