module Year2021
  module Day3
    class Problem2 < Problem
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
        230
      end

      def result
        oxygen_generator_rating * co2_scrubber_rating
      end

      def oxygen_generator_rating
        the_lines = lines

        index = 0

        loop do
          line_count = the_lines.count

          return the_lines.first.to_i(2) if line_count == 1

          one_count = the_lines.count { it[index] == '1' }
          zero_count = line_count - one_count

          keep_character = one_count >= zero_count ? '1' : '0'
          the_lines = the_lines.select { it[index] == keep_character }

          index += 1
        end
      end

      def co2_scrubber_rating
        the_lines = lines

        index = 0

        loop do
          line_count = the_lines.count

          return the_lines.first.to_i(2) if line_count == 1

          one_count = the_lines.count { it[index] == '1' }
          zero_count = line_count - one_count

          keep_character = one_count < zero_count ? '1' : '0'
          the_lines = the_lines.select { it[index] == keep_character }

          index += 1
        end
      end
    end
  end
end
