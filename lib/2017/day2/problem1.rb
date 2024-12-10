module Year2017
  module Day2
    class Problem1 < Problem
      def result
        rows = lines

        # rows = "5 1 9 5
        # 7 5 3
        # 2 4 6 8
        # ".split("\n")

        # rows = "5 9 2 8
        # 9 4 7 3
        # 3 8 6 5
        # ".split("\n")

        rows
          .map { |row| row.split.map(&:to_i) }
          .sum { |row| row.max - row.min }
        # 51139
      end
    end
  end
end
