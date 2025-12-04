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
        43
      end

      class Map
        attr_reader :grid

        def initialize(lines)
          @grid = lines.map(&:chars)
        end

        def solve
          total = 0
          loop do
            count = 0
            width.times do |c|
              height.times do |r|
                coord = [r, c]

                if roll_can_be_accessed?(coord)
                  count += 1
                  remove_roll(coord)
                end
              end
            end
            return total if count == 0
            total += count
          end
        end

        private

        def remove_roll((r, c))
          grid[r][c] = '.'
        end

        def roll_can_be_accessed?(coord)
          return false unless has_roll?(coord)

          adject_positions(coord).count { |coord| has_roll?(coord) } < 4
        end

        def adject_positions(coord)
          adjacent_deltas.map { |delta| delta.zip(coord).map(&:sum) }
        end

        def has_roll?((r, c))
          return false unless (0...width).cover?(c)
          return false unless (0...height).cover?(r)

          grid[r][c] == '@'
        end

        def adjacent_deltas
          @adjacent_deltas ||= [-1, 0, 1].product([-1, 0, 1]) - [[0, 0]]
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
