module Year2024
  module Day10
    class Trailhead < Struct.new(:map, :starting_position)
      def score
        destination_count
      end

      def rating
        distinct_trail_count
      end

      private

      def destination_count
        destinations = find_destinations(starting_position, 0)
        destinations.uniq.count
      end

      def distinct_trail_count
        destinations = find_destinations(starting_position, 0)
        destinations.count
      end

      def find_destinations(position, elevation)
        return position if elevation == 9

        position.orthogonally_adjacent_positions.map { |adjacent_position|
          if map.content_at?(elevation + 1, adjacent_position)
            find_destinations(adjacent_position, elevation + 1)
          end
        }.flatten.compact
      end
    end

    class Map < Grid
      def initialize(input)
        super(input.split("\n").map { |line| line.chars.map(&:to_i) })
      end

      def trailhead_score_sum
        trailheads.sum(&:score)
      end

      def trailhead_rating_sum
        trailheads.sum(&:rating)
      end

      private

      def trailheads
        find_all(0).map { |starting_position| Trailhead.new(self, starting_position) }
      end
    end

    class Problem1 < Problem
      def result
        # input = "89010123
        # 78121874
        # 87430965
        # 96549874
        # 45678903
        # 32019012
        # 01329801
        # 10456732"

        Map.new(input).trailhead_score_sum # 36, 514
      end
    end
  end
end
