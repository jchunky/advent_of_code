require "active_support/all"

input = File.read("input.txt").chomp
# input = "2333133121414131402"
p input

# 00...111...2...333.44.5555.6666.777.888899

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
p(array.map.with_index { |value, index| value.to_i * index }.sum) # 1928, 6307275788409

array =
  input.chars.flat_map.with_index do |char, i|
    (i.even? ? [i / 2] : ["."]) * char.to_i
  end
tally = array.tally
p(
  (array.uniq - ["."]).reverse.each do |file_id|
    file_position = array.index(file_id)
    file_length = tally[file_id]
    freespace_position = array.join.index("." * file_length)
    # p [file_id, file_position, file_length, freespace_position]
    next unless freespace_position && freespace_position < file_position

    (freespace_position...freespace_position + file_length).each do |i|
      array[i] = file_id
    end
    (file_position...file_position + file_length).each do |i|
      array[i] = "."
    end
  end
)
p(array.map.with_index { |value, index| value.to_i * index }.sum) # 2858,
