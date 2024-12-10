module Year2015
  module Day2
    class Problem1 < Problem
      def self.test_input
        "2x3x4
1x1x10
"
      end

      def self.test_result
        101
      end

      def result
        lines.sum { |l| required_wrapping_paper(l) }
      end

      def required_wrapping_paper(line)
        a, b, c = line.split("x").map(&:to_i).sort
        (a * b) + (2 * ((a * b) + (b * c) + (c * a)))
      end
    end
  end
end
