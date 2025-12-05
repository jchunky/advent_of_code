module Year2022
  module Day4
    class Problem2 < Problem
      def self.test_input
        "2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
"
      end

      def self.test_result
        2
      end

      def result
        lines.map.count do |line|
          a, b = line.split(",")
          a, b = to_range(a), to_range(b)
          a.cover?(b) || b.cover?(a)
        end
      end

      def to_range(s)
        l, u = s.split("-")
        (l.to_i..u.to_i)
      end
    end
  end
end
