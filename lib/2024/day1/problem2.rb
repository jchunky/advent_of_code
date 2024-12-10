module Year2024
  module Day1
    class Problem2 < Problem
      def self.test_input
        "3   4
4   3
2   5
1   3
3   9
3   3
"
      end

      def self.test_result
        31
      end

      def result
        first, second = lines.map(&:split).transpose
        first, second = [first, second].map { |e| e.map(&:to_i) }.map(&:sort)

        first.sum { |n| n * second.count(n) }
      end
    end
  end
end
