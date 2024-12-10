module Year2018
  module Day2
    class Problem2 < Problem
      def self.test_result
        "iosnxmfkpabcjpdywvrtahluy"
      end

      def result
        c, d = lines.combination(2).select do |a, b|
          a.chars.zip(b.chars).count { |a, b|
            a != b
          } == 1
        end.flatten

        c.length.times
          .select { |i| c[i] == d[i] }
          .map { |i| c[i] }
          .join
      end
    end
  end
end
