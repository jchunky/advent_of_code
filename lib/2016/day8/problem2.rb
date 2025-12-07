module Year2016
  module Day8
    class Problem2 < Problem
      def self.test_input
        "rect 3x2
rotate column x=1 by 1
rotate row y=0 by 4
rotate column x=1 by 1
"
      end

      def self.test_result
        6
      end

      def result
        screen = 6.times.map { ['.'] * 50 }

        lines.each do |line|
          case line
          when /rect/
            w, h = line.scan(/\d+/).map(&:to_i)
            h.times do |r|
              w.times do |c|
                screen[r][c] = '#'
              end
            end
          when /rotate column/
            i, rotation = line.scan(/\d+/).map(&:to_i)
            screen = screen.transpose
            screen[i].rotate!(-rotation)
            screen = screen.transpose
          when /rotate row/
            i, rotation = line.scan(/\d+/).map(&:to_i)
            screen[i].rotate!(-rotation)
          end

          # puts ["", ""] + screen.map(&:join)
        end

        screen.flatten.count('#')
      end
    end
  end
end
