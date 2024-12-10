module Year2024
  module Day6
    class Problem2 < Problem
      class MyGrid < Grid
        def find_guard_position
          find_content("^")
        end

        def each_variation
          return enum_for(:each_variation) unless block_given?

          each_position do |position|
            next if obstacle_at?(position) || guard_at?(position)

            new_grid = dup
            new_grid.place_obstacle_at(position)
            yield(new_grid)
          end
        end

        def place_obstacle_at(position)
          place_content_at("#", position)
        end

        private

        def obstacle_at?(position)
          content_at?("#", position)
        end

        def guard_at?(position)
          content_at?("^", position)
        end
      end

      class Guard < Walker
        def walk
          while on_grid? && !in_loop?
            turn_right while facing_obstacle?
            step while on_grid? && !facing_obstacle?
          end
        end

        def facing_obstacle?
          facing_content?("#")
        end
      end

      class Map
        attr_reader :grid, :starting_guard_position

        def initialize(rows)
          @grid = MyGrid.new(rows)
          @starting_guard_position = @grid.find_guard_position
        end

        def variations_with_loop_count
          grid.each_variation.with_index.count do |grid, i|
            print "." if i % grid.rows.size == 0
            guard = Guard.new(grid, starting_guard_position)
            guard.walk
            guard.in_loop?
          end
        end
      end

      def self.test_input
        "....#.....
.........#
..........
..#.......
.......#..
..........
.#..^.....
........#.
#.........
......#...
"
      end

      def self.test_result
        6
      end

      def result
        rows = lines.map(&:chars)
        map = Map.new(rows)
        map.variations_with_loop_count
      end
    end
  end
end
