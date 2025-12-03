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
        157
      end

      VALUES = (('a'..'z').to_a + ('A'..'Z').to_a).zip((1..52).to_a).to_h

      def result
        lines.sum do |line|
          line = line.chars
          half = line.length / 2
          a, b = line.first(half), line.last(half)
          letter = a.intersection(b).first
          VALUES[letter]
        end
      end
    end
  end
end
