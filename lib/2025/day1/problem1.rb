module Year2025
  module Day1
    class Problem1 < Problem
      def self.test_input
        "L68
L30
R48
L5
R60
L55
L1
L99
R14
L82
"
      end

      def self.test_result
        3
      end

      def result
        zero_position_count = 0
        dial = (0..99).to_a
        dial.rotate!(50)
        lines.each do |line|
          rotation = line.tr('LR', '-+').to_i
          dial.rotate!(rotation)
          zero_position_count += 1 if dial[0] == 0
        end
        zero_position_count
      end
    end
  end
end
