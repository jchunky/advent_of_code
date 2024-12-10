module Year2019
  module Day1
    class Problem1 < Problem
      def result
        lines.map(&:to_i).sum { |mass| (mass / 3) - 2 }
      end
    end
  end
end
