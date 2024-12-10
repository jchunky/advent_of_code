module Year2018
  module Day2
    class Problem2 < Problem
      def self.test_input
        "abcde
fghij
klmno
pqrst
fguij
axcye
wvxyz"
      end

      def self.test_result
        "fgij"
      end

      def result
        e, f = lines.combination(2).select { |a, b|
          a.chars.zip(b.chars).count { |c, d| c != d } == 1
        }.flatten

        e.length.times
          .select { |i| e[i] == f[i] }
          .map { |i| e[i] }
          .join
      end
    end
  end
end
