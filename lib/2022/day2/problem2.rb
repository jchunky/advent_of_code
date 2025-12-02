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
        12
      end

      SCORE = {
        "A X" => 3 + 0,
        "A Y" => 1 + 3,
        "A Z" => 2 + 6,
        "B X" => 1 + 0,
        "B Y" => 2 + 3,
        "B Z" => 3 + 6,
        "C X" => 2 + 0,
        "C Y" => 3 + 3,
        "C Z" => 1 + 6,
      }

      def result
        lines.sum { SCORE[it] }
      end
    end
  end
end
