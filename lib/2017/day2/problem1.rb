module Year2017
  module Day2
    class Problem1 < Problem
      def self.test_input
        "5 1 9 5
7 5 3
2 4 6 8
"
      end

      def self.test_result
        18
      end

      def result
        lines
          .map { |row| row.split.map(&:to_i) }
          .sum { |row| row.max - row.min }
      end
    end
  end
end
