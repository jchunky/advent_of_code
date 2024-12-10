module Year2015
  module Day2
    class Problem2 < Problem
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
