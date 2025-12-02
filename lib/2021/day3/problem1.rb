module Year2021
  module Day3
    class Problem1 < Problem
      def self.test_input
        "00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010
"
      end

      def self.test_result
        198
      end

      def result
        line_count = lines.count

        counts = [0] * lines[0].length

        lines.each do |line|
          line.chars.each_with_index do |c, i|
            counts[i] += 1 if c == '1'
          end
        end

        gamma_rate = counts
          .map { |count| count > line_count / 2 ? '1' : '0' }
          .join.to_i(2)

        epsilon_rate = counts
          .map { |count| count < line_count / 2 ? '1' : '0' }
          .join.to_i(2)

        gamma_rate * epsilon_rate
      end
    end
  end
end
