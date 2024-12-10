module Year2018
  module Day2
    class Problem1 < Problem
      def result
        pairs = lines.count { |line| line.chars.tally.value?(2) }
        triples = lines.count { |line| line.chars.tally.value?(3) }
        pairs * triples # 8610
      end
    end
  end
end
