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
        c, d = lines.combination(2).select { |a, b|
          a.chars.zip(b.chars).count { |a, b|
            a != b
          } == 1
        }.flatten

        c.length.times
          .select { |i| c[i] == d[i] }
          .map { |i| c[i] }
          .join
      end
    end
  end
end
