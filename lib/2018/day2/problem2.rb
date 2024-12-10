module Year2018
  module Day2
    class Problem2 < Problem
      def result
        lines.combination(2).select do |a, b|
          a.chars.zip(b.chars).count { |a, b|
            a != b
          } == 1
        end
      end
    end
  end
end
