module Year2020
  module Day3
    class Problem2 < Problem
      def self.test_input
        "..##.......
#...#...#..
.#....#..#.
..#.#...#.#
.#...##..#.
..#.##.....
.#.#.#....#
.#........#
#.##...#...
#...##....#
.#..#...#.#
"
      end

      def self.test_result
        7
      end

      class Map < Struct.new(:grid)
        def solve
          tree_count = 0
          position = [0, 0]
          tree_count += 1 if tree?(position)
          while !bottom?(position)
            position = apply_delta(position, [1, 3])
            tree_count += 1 if tree?(position)
          end
          tree_count
        end

        def tree?(coord)
          grid[coord[0]][coord[1]] == '#'
        end

        def bottom?(coord)
          coord[0] == height - 1
        end

        def width
          grid[0].size
        end

        def height
          grid.size
        end

        def apply_delta(coord, delta)
          [
            [coord, delta].map(&:first).sum,
            [coord, delta].map(&:last).sum % width
          ]
        end

        def method_name

        end
      end

      def result
        Map.new(lines).solve
      end
    end
  end
end
