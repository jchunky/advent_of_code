module Year2017
  module Day5
    class Problem1 < Problem
      def self.test_input
        "0
3
0
1
-3
"
      end

      def self.test_result
        5
      end

      def result
        instructions = lines.map(&:to_i)
        position = 0
        steps = 0

        loop do
          jump = instructions[position]
          increment = 1
          instructions[position] += increment
          position += jump
          steps += 1
          raise(ResultException, steps) unless (0...instructions.count).cover?(position) # 5, 355965
        end
      end
    end
  end
end
