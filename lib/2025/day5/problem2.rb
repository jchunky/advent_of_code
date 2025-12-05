module Year2025
  module Day5
    class Problem2 < Problem
      def self.test_input
        "3-5
10-14
16-20
12-18

1
5
8
11
17
32
"
      end

      def self.test_result
        14
      end

      def result
        valid_ranges, available_items = input.split("\n\n")
        valid_ranges = valid_ranges.split("\n").map { |s| s.split("-").map(&:to_i) }.map { |l, u| (l..u) }

        loop do
          a, b = (0...valid_ranges.count).to_a.combination(2).find { |a, b| valid_ranges[a].overlap?(valid_ranges[b]) }
          break unless a

          valid_ranges << merge(valid_ranges[a], valid_ranges[b])
          valid_ranges.delete_at(b)
          valid_ranges.delete_at(a)
        end

        valid_ranges.sum(&:count)
      end

      def merge(a, b)
        ([a.min, b.min].min..[a.max, b.max].max)
      end
    end
  end
end
