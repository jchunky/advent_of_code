module Year2021
  module Day1
    class Problem2 < Problem
      def result
        lines.map(&:to_i).each_cons(3).map(&:sum).each_cons(2).count { |a, b| a < b } # 1739
      end
    end
  end
end
