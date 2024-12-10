module Year2024
  module Day9
    class Problem2 < Problem
      def result
        return 0 # todo
        # input = "2333133121414131402"

        # 00...111...2...333.44.5555.6666.777.888899

        array =
          input.chars.flat_map.with_index do |char, i|
            (i.even? ? [i / 2] : ["."]) * char.to_i
          end
        tally = array.tally
        (array.uniq - ["."]).reverse_each.with_index do |file_id, i|
          file_position = array.index(file_id)
          file_length = tally[file_id]
          freespace_position = array.length.times.find do |j|
            (j...j + file_length).all? { |k| array[k] == "." }
          end
          next unless freespace_position && freespace_position < file_position

          (freespace_position...freespace_position + file_length).each do |i|
            array[i] = file_id
          end
          (file_position...file_position + file_length).each do |i|
            array[i] = "."
          end
        end
        array.map.with_index { |value, index| value.to_i * index }.sum # 2858, 6327174563252
      end
    end
  end
end
