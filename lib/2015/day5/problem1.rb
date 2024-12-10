module Year2015
  module Day5
    class Problem1 < Problem
      DUPLICATES = ("a".."z").map { |l| l * 2 }
      BANNED = %w[ab cd pq xy]

      def self.test_result
        258
      end

      def result
        strings = lines

        strings.count { |s| nice?(s) } # 258
      end

      def nice?(string)
        enough_vowels = string.chars.count { |c| %w[a e i o u].include?(c) } >= 3
        duplicate = DUPLICATES.any? { |d| string.include?(d) }
        banned = BANNED.any? { |b| string.include?(b) }
        enough_vowels && duplicate && !banned
      end
    end
  end
end
