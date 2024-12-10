module Year2024
  module Day10
    class Problem2 < Problem
      def result
        # input = "89010123
        # 78121874
        # 87430965
        # 96549874
        # 45678903
        # 32019012
        # 01329801
        # 10456732"

        Map.new(input).trailhead_rating_sum # 81, 1162
      end
    end
  end
end
