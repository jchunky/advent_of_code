module Year2021
  module Day3
    class Problem2 < Problem
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
        900
      end

      def result
        v = 0
        h = 0
        aim = 0

        lines.each do |line|
          direction, x = line.split
          x = x.to_i

          case direction
          when 'forward'
            h += x
            v += aim * x
          when 'down'
            aim += x
          when 'up'
            aim -= x
          end
        end

        v * h
      end
    end
  end
end
