module Year2024
  module Day10
    class Problem2 < Problem
      def self.test_input
        "89010123
78121874
87430965
96549874
45678903
32019012
01329801
10456732
"
      end

      def self.test_result
        81
      end

      def result
        Map.new(input).trailhead_rating_sum
      end
    end
  end
end
