module Year2024
  module Day5
    class Problem1 < Problem
      def self.test_input
        "47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13

75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47
"
      end

      def self.test_result
        143
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
