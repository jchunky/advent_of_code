module Year2024
  module Day2
    class Problem1 < Problem
      def result
        reports = lines.map(&:split).map { |e| e.map(&:to_i) }

        reports.count { safe?(_1) }
      end

      def safe?(report)
        return false unless [report.sort, report.sort.reverse].include?(report)

        report.each_cons(2).all? { |a, b| (a - b).abs.in?(1..3) }
      end
    end
  end
end
