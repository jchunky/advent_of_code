module Year2024
  module Day8
    class AntennaGrid < Grid
      def antenna_positions_by_frequency
        each_position
          .reject { |position| content_of(position) == "." }
          .group_by { |position| content_of(position) }
      end
    end

    class AntinodeGrid < Grid
      def initialize(size)
        rows = Array.new(size) { "." * size }
        super(rows)
      end

      def antinode_count
        rows.join.count("#")
      end

      def place_antinode_at(position)
        place_content_at("#", position)
      end
    end

    class Problem1 < Problem
      class Map
        attr_reader :antennas, :antinodes

        def initialize(rows)
          @antennas = AntennaGrid.new(rows)
          @antinodes = AntinodeGrid.new(rows.size)
        end

        def antinode_count
          antennas.antenna_positions_by_frequency.each do |_frequency, positions|
            record_antinodes(positions)
          end
          antinodes.antinode_count
        end

        private

        def record_antinodes(positions)
          positions.permutation(2).each do |a, b|
            delta = a.delta(b)
            antinode = b + delta
            antinodes.place_antinode_at(antinode)
          end
        end
      end

      def self.test_input
        "............
........0...
.....0......
.......0....
....0.......
......A.....
............
............
........A...
.........A..
............
............
"
      end

      def self.test_result
        14
      end

      def result
        rows = lines.map(&:chars)
        map = Map.new(rows)
        map.antinode_count
      end
    end
  end
end
