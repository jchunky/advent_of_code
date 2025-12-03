module Year2019
  module Day2
    class Problem2 < Problem
      def self.test_input
        "1,9,10,3,2,3,11,0,99,30,40,50
"
      end

      def self.test_result
        910
      end

      def result
        list = lines.first.split(",").map(&:to_i)
        index = 0

        target = 3500
        # target = 19690720

        (0..99).to_a.each do |noun|
          (0..99).to_a.each do |verb|

            return 100 * noun + verb if compute(list.dup, noun, verb) == target
          end
        end
      end

      def compute(list, noun, verb)
        index = 0

        list[1] = noun
        list[2] = verb

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
      rescue => ex
        -1
      end
    end
  end
end
