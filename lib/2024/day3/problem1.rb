module Year2024
  module Day3
    class Problem1 < Problem
      def self.test_result
        184511516
      end

      def result
        input
          .scan(/mul\((\d+),(\d+)\)/)
          .map { |a| a.map(&:to_i) }
          .sum { |a, b| a * b }
      end
    end
  end
end