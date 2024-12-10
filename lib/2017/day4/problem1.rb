module Year2017
  module Day4
    class Problem1 < Problem
      def result
        lines.count { |l| valid?(l) } # 451
      end

      def valid?(pass_phrase)
        words = pass_phrase.chomp.split
        words.count == words.uniq.count
      end
    end
  end
end
