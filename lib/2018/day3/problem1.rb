module Year2018
  module Day3
    class Problem1 < Problem
      def self.test_input
        "#1 @ 1,3: 4x4
#2 @ 3,1: 4x4
#3 @ 5,5: 2x2
"
      end

      def self.test_result
        4
      end

      def result
        grid = []

        lines.each do |line|
          _, id, col, row, width, height = line.split(/[#@,:x]/).map(&:to_i)

          row.upto(row + height - 1).each do |r|
            col.upto(col + width - 1).each do |c|
              grid[r] ||= []
              grid[r][c] = if grid[r][c]
                             "X"
                           else
                             id
                           end
            end
          end
        end

        grid.flatten.count("X")
      end
    end
  end
end
