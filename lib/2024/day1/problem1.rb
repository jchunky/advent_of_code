module Year2024
  module Day1
    class Problem1 < Problem
      def result
        first, second = lines.map(&:split).transpose
        first, second = [first, second].map { |e| e.map(&:to_i) }.map(&:sort)

        first.zip(second).sum { |a, b| (a - b).abs }
      end
    end
  end
end
