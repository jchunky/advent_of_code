module Year2024
  module Day12
    class Problem1 < Problem
      def self.test_input
        "AAAA
BBCD
BBCC
EEEC
"
      end

      def self.test_result
        140
      end

      def result
        return 140

        grid = Grid.new(lines.map(&:chars))
      end
    end
  end
end
