module Year2021
  module Day2
    class Problem1 < Problem
      def self.test_input
        "forward 5
down 5
forward 8
up 3
down 8
forward 2
"
      end

      def self.test_result
        150
      end

      def result
        v = 0
        h = 0

        lines.each do |line|
          direction, magnitude = line.split
          magnitude = magnitude.to_i

          case direction
          when 'forward'
            h += magnitude
          when 'down'
            v += magnitude
          when 'up'
            v -= magnitude
          end
        end

        v * h
      end
    end
  end
end
