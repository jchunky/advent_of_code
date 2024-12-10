module Year2018
  module Day2
    class Problem1 < Problem
      def self.test_input
        "abcdef
bababc
abbcde
abcccd
aabcdd
abcdee
ababab
"
      end

      def self.test_result
        12
      end

      def result
        pairs = lines.count { |line| line.chars.tally.value?(2) }
        triples = lines.count { |line| line.chars.tally.value?(3) }
        pairs * triples
      end
    end
  end
end
