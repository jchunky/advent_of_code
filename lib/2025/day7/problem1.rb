module Year2025
  module Day7
    class Problem1 < Problem
      def self.test_input
        ".......S.......
...............
.......^.......
...............
......^.^......
...............
.....^.^.^.....
...............
....^.^...^....
...............
...^.^...^.^...
...............
..^...^.....^..
...............
.^.^.^.^.^...^.
...............
"
      end

      def self.test_result
        21
      end

      class Solver < Struct.new(:grid)
        def initialize(lines)
          super(lines.map(&:chars))
        end

        def solve
          height.times do |r|
            width.times do |c|
              grid[r][c] = '|' if should_be_beam?(r, c)
            end
          end

          # puts inspect

          height.times.sum do |r|
            width.times.count do |c|
              at(r, c) == '^' && at(r - 1, c) == '|'
            end
          end
        end

        def inspect
          [""] + grid.map(&:join)
        end

        private

        def should_be_beam?(r, c)
          return false if at(r, c) == '^'
          return true if ['|', 'S'].include?(at(r - 1, c))
          return true if at(r, c + 1) == '^' && at(r - 1, c + 1) == '|'
          return true if at(r, c - 1) == '^' && at(r - 1, c - 1) == '|'

          false
        end

        def at(r, c)
          return nil unless (0...height).cover?(r)
          return nil unless (0...width).cover?(c)

          grid[r][c]
        end

        def width
          grid.first.size
        end

        def height
          grid.size
        end
      end

      def result
        Solver.new(lines).solve
      end
    end
  end
end
