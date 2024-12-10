module Year2017
  module Day4
    class Problem2 < Problem
      def self.test_result
        223
      end

      def result
        lines.count { |l| improved_valid?(l) } # 451
      end

      def improved_valid?(pass_phrase)
        words = pass_phrase.chomp.split

        words.count == words.uniq.count &&
          words.combination(2).none? { |a, b| a.chars.sort == b.chars.sort }
      end

      def valid?(pass_phrase)
        words = pass_phrase.chomp.split
        words.count == words.uniq.count
      end
    end
  end
end
