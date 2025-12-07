module Year2025
  module Day7
    class Problem2 < Problem
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
        40
      end

      class Solver < Struct.new(:grid)
        def initialize(lines)
          super(lines.map(&:chars))
        end

        def solve
          height.times do |r|
            width.times do |c|
              grid[r][c] = 0 if at(r, c) == '.'
              grid[r][c] = 1 if at(r, c) == 'S'
            end
          end

          height.times do |r|
            width.times do |c|
              grid[r][c] += beam_increment(r, c) if at(r, c) != '^'
            end
          end

          # puts inspect

          grid[-1].sum
        end

        def inspect
          [""] + grid.map(&:join)
        end

        private

        def beam_increment(r, c)
          result = 0
          result += at(r - 1, c).to_i
          result += at(r - 1, c - 1).to_i if at(r, c - 1) == '^'
          result += at(r - 1, c + 1).to_i if at(r, c + 1) == '^'
          result
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
