module Year2022
  module Day6
    class Problem2 < Problem
      def self.test_input
        "mjqjpqmgbljsphdztnvjfqwrcgsmlb
"
      end

      def self.test_result
        19
      end

      def result
        find_sequence(input, 14)
      end

      def find_sequence(s, length)
        i = 0
        loop do
          return i + length if s[i, length].chars.uniq.count == length
          i += 1
        end
      end
    end
  end
end
