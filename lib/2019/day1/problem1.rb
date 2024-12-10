module Year2019
  module Day1
    class Problem1 < Problem
      def self.test_input
        "12
14
1969
100756
"
      end

      def self.test_result
        34241
      end

      def result
        lines.map(&:to_i).sum { |mass| (mass / 3) - 2 }
      end
    end
  end
end
