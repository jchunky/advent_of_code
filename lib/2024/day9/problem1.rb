module Year2024
  module Day9
    class Problem1 < Problem
      def self.test_input
        "2333133121414131402"
        # 00...111...2...333.44.5555.6666.777.888899
      end

      def self.test_result
        1928
      end

      def result
        array =
          input.chars.flat_map.with_index do |char, i|
            (i.even? ? [i / 2] : ["."]) * char.to_i
          end
        i = 0
        j = array.size - 1
        loop do
          i += 1 while array[i] != "." && i < j
          j -= 1 while array[j] == "." && i < j
          break unless i < j

          array[i] = array[j]
          array[j] = "."
        end
        array.map.with_index { |value, index| value.to_i * index }.sum # 1928, 6307275788409
      end
    end
  end
end
