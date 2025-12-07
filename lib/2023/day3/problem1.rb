module Year2023
  module Day3
    class Problem1 < Problem
      def self.test_input
        "467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
"
      end

      def self.test_result
        4361
      end

      class Solver < Struct.new(:grid)
        def solve
          part_number_coords
            .select(&method(:number_adjacent_to_symbol?))
            .map(&:last)
            .map(&:to_i)
            .sum
        end

        private

        def part_number_coords
          (0...height).flat_map do |r|
            (0...width).map do |c|
              next unless digit?(r, c) && !digit?(r, c - 1)
              [[r, c], grid[r][c..].scan(/\b\d+\b/).first]
            end.compact
          end
        end

        def number_adjacent_to_symbol?(((r, c), number))
          number.size.times.any? { |i| adjacent_to_symbol?(r, c + i) }
        end

        def adjacent_to_symbol?(r, c)
          adjacent_deltas.any? do |rd, cd|
            symbol?(r + rd, c + cd)
          end
        end

        def digit?(r, c)
          at(r, c) =~ /\d/
        end

        def symbol?(r, c)
          at(r, c) =~ /[^\d\.]/
        end

        def at(r, c)
          return unless (0...height).cover?(r)
          return unless (0...width).cover?(c)

          grid[r][c]
        end

        def adjacent_deltas
          @adjacent_deltas ||= [-1, 0, 1].product([-1, 0, 1]) - [[0, 0]]
        end

        def width
          @width ||= grid.first.size
        end

        def height
          @height ||= grid.size
        end
      end

      def result
        Solver.new(lines).solve
      end
    end
  end
end
