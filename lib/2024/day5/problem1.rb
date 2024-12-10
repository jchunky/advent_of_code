module Year2024
  module Day5
    class Problem1 < Problem
      def self.test_result
        5588
      end

      def result
        rules, updates = input.split("\n\n")
        rules = rules.split("\n").map { |r| r.split("|").map(&:to_i) }
        updates = updates.split("\n").map { |u| u.split(",").map(&:to_i) }

        updates
          .select { |u| correct?(rules, u) }
          .sum { |u| middle(u) }
        # 5588
      end

      def correct?(rules, update)
        rules.all? { |r| correct_by_rule?(r, update) }
      end

      def correct_by_rule?(rule, update)
        i, j = rule.map { |n| update.index(n) }
        !i || !j || i < j
      end

      def middle(array)
        array[array.length / 2]
      end
    end
  end
end
