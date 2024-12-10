module Year2020
  module Day1
    class Problem1 < Problem
      def result
        lines.map(&:to_i).combination(2).find { |a, b| a + b == 2020 }.reduce(:*)
      end
    end
  end
end
