module Year2024
  module Day8
    class Problem2 < Problem
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
            antinodes.place_antinode_at(a)
            antinodes.place_antinode_at(b)
            delta = a.delta(b)
            antinode = b + delta
            while antinodes.include?(antinode)
              antinodes.place_antinode_at(antinode)
              antinode += delta
            end
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
        34
      end

      def result
        rows = lines.map(&:chars)
        map = Map.new(rows)
        map.antinode_count
      end
    end
  end
end
