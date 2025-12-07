module Year2022
  module Day6
    class Problem1 < Problem
      def self.test_input
        "mjqjpqmgbljsphdztnvjfqwrcgsmlb
"
      end

      def self.test_result
        7
      end

      def result
        i = 0
        loop do
          return i + 4 if input[i, 4].chars.uniq.count == 4
          i += 1
        end
      end
    end
  end
end
