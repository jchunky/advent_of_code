module Year2022
  module Day2
    class Problem2 < Problem
      def self.test_input
        "A Y
B X
C Z
"
      end

      def self.test_result
        15
      end

      SCORE = {
        "A X" => 1 + 3,
        "A Y" => 2 + 6,
        "A Z" => 3 + 0,
        "B X" => 1 + 0,
        "B Y" => 2 + 3,
        "B Z" => 3 + 6,
        "C X" => 1 + 6,
        "C Y" => 2 + 0,
        "C Z" => 3 + 3,
      }

      def result
        lines.sum { SCORE[it] }
      end
    end
  end
end
