module Year2025
  module Day5
    class Problem1 < Problem
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
        3
      end

      def result
        valid_ranges, available_items = input.split("\n\n")
        valid_ranges = valid_ranges.split("\n").map { |s| s.split("-").map(&:to_i) }.map { |l, u| (l..u) }
        available_items = available_items.split("\n").map(&:to_i)

        available_items.count { |i| valid_ranges.any? { |r| r.cover?(i) } }
      end
    end
  end
end
