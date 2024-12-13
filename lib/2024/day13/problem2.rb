module Year2024
  module Day13
    class Problem2 < Problem
      def self.test_input
        "125 17"
      end

      def self.test_result
        22
      end

      def result
        blink_count = 6
        # blink_count = 25
        stones = input.split.map(&:to_i)
        blink_count.times do
          stones = stones.flat_map do |stone|
            case
            when stone == 0
              1
            when stone.digits.count.even?
              a, b = stone.to_s.chars
                .each_slice(stone.digits.count / 2)
                .map { |digits| digits.join.to_i }
              [a, b]
            else
              stone * 2024
            end
          end
        end
        stones.count
      end
    end
  end
end
