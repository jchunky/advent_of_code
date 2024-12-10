module Year2015
  module Day5
    class Problem2 < Problem
      DUPLICATES = ("a".."z").map { |l| l * 2 }
      BANNED = %w[ab cd pq xy]

      def result
        strings = lines

        strings.count { |s| improved_nice?(s) } # 53
      end

      def improved_nice?(string)
        duplicate_pair?(string) && pair_sandwich?(string)
      end

      def duplicate_pair?(string)
        0.upto(string.length - 3).any? { |i| string[i + 2..].include?(string[i, 2]) }
      end

      def pair_sandwich?(string)
        0.upto(string.length - 3).any? { |i| string[i] == string[i + 2] }
      end
    end
  end
end
