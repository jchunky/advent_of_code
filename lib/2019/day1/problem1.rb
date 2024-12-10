module Year2019
  module Day1
    class Problem1 < Problem
      def self.test_result
        3399947
      end

      def result
        lines.map(&:to_i).sum { |mass| (mass / 3) - 2 }
      end
    end
  end
end
