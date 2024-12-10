module Year2020
  module Day1
    class Problem2 < Problem
      def self.test_result
        171933104
      end

      def result
        lines.map(&:to_i).combination(3).find { |a, b, c| a + b + c == 2020 }.reduce(:*)
      end
    end
  end
end
