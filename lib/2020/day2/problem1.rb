module Year2020
  module Day2
    class Problem1 < Problem
      def self.test_input
        "1-3 a: abcde
1-3 b: cdefg
2-9 c: ccccccccc
"
      end

      def self.test_result
        2
      end

      def result
        lines.count do |line|
          lower, upper, letter, _, password = line.split(/\W/)
          (lower.to_i..upper.to_i).cover?(password.chars.tally[letter])
        end
      end
    end
  end
end
