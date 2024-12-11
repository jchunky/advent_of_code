module Year2024
  module Day11
    class Problem2 < Problem
      def self.test_input
        "125 17"
      end

      def self.test_result
        22
      end

      def result
        blink_count = 6
        # blink_count = 75
        stones = input.split.map(&:to_i)
        blink_count.times.each do
          print "."
          offset = 0
          (0...stones.count).each do |i|
            stone = stones[i + offset]
            case
            when stone == 0
              stones[i + offset] = 1
            when stone.digits.count.even?
              a, b = stone.to_s.chars
                .each_slice(stone.digits.count / 2)
                .map { |digits| digits.join.to_i }
              stones[i + offset] = a
              stones.insert(i + offset + 1, b)
              offset += 1
            else
              stones[i + offset] = stone * 2024
            end
          end
        end
        stones.count
      end
    end
  end
end
