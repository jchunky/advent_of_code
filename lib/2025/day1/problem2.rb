module Year2025
  module Day1
    class Problem2 < Problem
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
        6
      end

      def result
        zero_position_count = 0
        dial = (0..99).to_a
        dial.rotate!(50)
        lines.each do |line|
          direction = line[0] == 'L' ? -1 : 1
          rotation = line[1..].to_i
          rotation.times do
            dial.rotate!(direction)
            zero_position_count += 1 if dial[0] == 0
          end
        end
        zero_position_count
      end
    end
  end
end
