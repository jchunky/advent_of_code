module Year2020
  module Day6
    class Problem2 < Problem
      def self.test_input
        "abcx
abcy
abcz
"
      end

      def self.test_result
        6
      end

      def result
        input.split("\n\n").map do |group|
          group.delete("\n").chars.uniq.size
        end.sum
      end
    end
  end
end
