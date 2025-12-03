module Year2022
  module Day3
    class Problem2 < Problem
      def self.test_input
        "vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
"
      end

      def self.test_result
        70
      end

      VALUES = (('a'..'z').to_a + ('A'..'Z').to_a).zip((1..52).to_a).to_h

      def result
        lines.each_slice(3).sum do |group|
          a, b, c = group.map(&:chars)
          letter = (a & b & c).first
          VALUES[letter]
        end
      end
    end
  end
end
