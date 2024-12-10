module Year2015
  module Day2
    class Problem2 < Problem
      def self.test_input
        "2x3x4
1x1x10
"
      end

      def self.test_result
        48
      end

      def result
        lines.sum { |l| required_ribbon(l) }
      end

      def required_ribbon(line)
        a, b, c = line.split("x").map(&:to_i).sort
        (2 * (a + b)) + (a * b * c)
      end
    end
  end
end
