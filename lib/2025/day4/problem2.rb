module Year2025
  module Day4
    class Problem2 < Problem
      def self.test_input
        "..@@.@@@@.
@@@.@.@.@@
@@@@@.@.@@
@.@@@@..@.
@@.@@@@.@@
.@@@@@@@.@
.@.@.@.@@@
@.@@@.@@@@
.@@@@@@@@.
@.@.@@@.@.
"
      end

      def self.test_result
        13
      end

      class Map < Struct.new(:grid)
        def solve
          count = 0
          width.times do |c|
            height.times do |r|
              coord = [r, c]

              count += 1 if rolls_can_be_accessed?(coord)
            end
          end
          count
        end

        private

        def rolls_can_be_accessed?(coord)
          return false unless has_roll?(coord)

          adject_positions(coord).count { |coord| has_roll?(coord) } < 4
        end

        def adject_positions(coord)
          deltas = [-1, 0, 1].product([-1, 0, 1]) - [[0, 0]]

          deltas.map { |delta| delta.zip(coord).map(&:sum) }
        end

        def has_roll?((r, c))
          return false unless (0...width).cover?(c)
          return false unless (0...height).cover?(r)

          grid[r][c] == '@'
        end


        def width
          grid[0].length
        end

        def height
          grid.count
        end
      end


      def result
        Map.new(lines).solve
      end
    end
  end
end
