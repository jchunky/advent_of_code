module Year2024
  module Day11
    class Problem2 < Problem
      attr_reader :results

      def self.test_input
        "125 17"
      end

      def self.test_result
        22
      end

      def initialize(input)
        super
        @results = {}
      end

      def result
        blink_count = 6
        # blink_count = 75

        stones = input.split.map(&:to_i)
        stones.sum do |stone|
          stone_count(stone, blink_count)
        end
      end

      def stone_count(stone, blink_count)
        return 1 if blink_count == 0

        cached_result = results[[stone, blink_count]]
        return cached_result if cached_result

        result =
          case
          when stone == 0
            stone_count(1, blink_count - 1)
          when stone.digits.count.even?
            a, b = stone.to_s.chars
              .each_slice(stone.digits.count / 2)
              .map { |digits| digits.join.to_i }
            stone_count(a, blink_count - 1) + stone_count(b, blink_count - 1)
          else
            stone_count(stone * 2024, blink_count - 1)
          end

        results[[stone, blink_count]] = result

        result
      end
    end
  end
end
