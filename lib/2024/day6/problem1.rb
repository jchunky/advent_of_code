module Year2024
  module Day6
    class Problem1 < Problem
      class Guard < Walker
        def walk
          while on_grid?
            turn_right while facing_obstacle?
            step
          end
        end

        def record_visit
          visit = [position.row, position.col].to_s
          visits[visit] = true
        end

        private

        def facing_obstacle?
          facing_content?("#")
        end
      end

      class MyGrid < Grid
        def find_guard
          find_content("^")
        end
      end

      class Map
        attr_reader :grid, :guard

        delegate :visit_count, to: :guard
        delegate :walk, to: :guard

        def initialize(rows)
          @grid = MyGrid.new(rows)
          @guard = Guard.new(@grid, @grid.find_guard)
        end
      end

      def result
        # input =
        #   "....#.....
        # .........#
        # ..........
        # ..#.......
        # .......#..
        # ..........
        # .#..^.....
        # ........#.
        # #.........
        # ......#...
        # ".split("\n")

        rows = lines.map(&:chars)
        map = Map.new(rows)
        map.walk
        map.visit_count # 5162
      end
    end
  end
end
