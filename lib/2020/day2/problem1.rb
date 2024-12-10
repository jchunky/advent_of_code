module Year2020
  module Day2
    class Problem1 < Problem
      def result
        # lines = "1-3 a: abcde
        # 1-3 b: cdefg
        # 2-9 c: ccccccccc
        # ".split("\n")

        lines.count do |line|
          lower, upper, letter, _, password = line.split(/\W/)
          (lower.to_i..upper.to_i).cover?(password.chars.tally[letter])
        end
      end
    end
  end
end
