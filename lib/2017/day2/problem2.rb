module Year2017
  module Day2
    class Problem2 < Problem
      def self.test_input
        "5 9 2 8
9 4 7 3
3 8 6 5"
      end

      def self.test_result
        9
      end

      def result
        lines
          .map { |row| row.split.map(&:to_i) }
          .sum do |row|
            a, b = row.sort.combination(2).find { |a, b| b % a == 0 }
            b / a
          end
      end
    end
  end
end
