module Year2019
  module Day2
    class Problem1 < Problem
      def self.test_input
        "1,9,10,3,2,3,11,0,99,30,40,50
"
      end

      def self.test_result
        3500
      end

      def result
        list = lines.first.split(",").map(&:to_i)
        index = 0

        # list[1] = 12
        # list[2] = 2

        loop do
          operation, a, b, destination = list[index, 4]

          case operation
          when 1 then list[destination] = list[a] + list[b]
          when 2 then list[destination] = list[a] * list[b]
          when 99 then break
          else raise "Unexpected operation: #{operation}"
          end

          index += 4
        end

        list[0]
      end
    end
  end
end
