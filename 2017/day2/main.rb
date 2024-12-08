require "active_support/all"

rows = File.readlines("input.txt")

# rows = "5 1 9 5
# 7 5 3
# 2 4 6 8
# ".split("\n")

# rows = "5 9 2 8
# 9 4 7 3
# 3 8 6 5
# ".split("\n")

checksum = rows
  .map { |row| row.split.map(&:to_i) }
  .sum { |row| row.max - row.min }
p checksum # 51139

checksum = rows
  .map { |row| row.split.map(&:to_i) }
  .sum do |row|
    a, b = row.sort.combination(2).find { |a, b| b % a == 0 }
    b / a
  end
p checksum # 272
