module Year2024
  module Day2
    class Problem2 < Problem
      def self.test_input
        "7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
"
      end

      def self.test_result
        4
      end

      def result
        reports = lines.map(&:split).map { |e| e.map(&:to_i) }

        reports.count { safe_with_dampening?(_1) }
      end

      def safe_with_dampening?(report)
        variations = Array.new(report.size) { |i| report.dup.tap { |r| r.delete_at(i) } }

        variations.any? { safe?(_1) }
      end

      def safe?(report)
        return false unless [report.sort, report.sort.reverse].include?(report)

        report.each_cons(2).all? { |a, b| (a - b).abs.in?(1..3) }
      end
    end
  end
end
