module Year2024
  module Day1
    class Problem2 < Problem
      def result
        first, second = lines.map(&:split).transpose
        first, second = [first, second].map { |e| e.map(&:to_i) }.map(&:sort)

        first.sum { |n| n * second.count(n) }
      end
    end
  end
end
