module Year2020
  module Day2
    class Problem2 < Problem
      def self.test_result
        272
      end

      def result
        # lines = "1-3 a: abcde
        # 1-3 b: cdefg
        # 2-9 c: ccccccccc
        # ".split("\n")

        lines.count do |line|
          lower, upper, letter, _, password = line.split(/\W/)
          a = password[lower.to_i - 1]
          b = password[upper.to_i - 1]
          a != b && [a, b].include?(letter)
        end
      end
    end
  end
end