module Year2023
  module Day3
    class Problem2 < Problem
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
        467835
      end

      class Solver < Struct.new(:grid)
        def solve
          gears
            .map(&method(:gear_ratio))
            .sum
        end

        private

        def gear_ratio(gear_coord)
          adjacent_part_number_coords = part_number_coords.select do |part_number_coord|
            gear_adjacent_to_part_number?(gear_coord, part_number_coord)
          end
          return 0 unless adjacent_part_number_coords.size == 2

          adjacent_part_number_coords.map(&:last).map(&:to_i).reduce(&:*)
        end

        def gear_adjacent_to_part_number?(coord, part_number_coord)
          r, c, number = part_number_coord.flatten
          number.size.times.any? { |i| adjacent?(coord, [r, c + i]) }
        end

        def adjacent?((r1, c1), (r2, c2))
          [r1 - r2, c1 - c2].map(&:abs).max <= 1
        end

        def part_number_coords
          @part_number_coords ||= (0...height).flat_map do |r|
            (0...width).map do |c|
              next unless digit?(r, c) && !digit?(r, c - 1)
              [[r, c], grid[r][c..].scan(/\b\d+\b/).first]
            end.compact
          end
        end

        def gears
          @gears ||= (0...height).flat_map do |r|
            (0...width).map do |c|
              [r, c] if gear?(r, c)
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

        def gear?(r, c)
          at(r, c) == '*'
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
