require "active_support/all"

lines = File.read("input.txt").split("\n")

# lines = "#1 @ 1,3: 4x4
# #2 @ 3,1: 4x4
# #3 @ 5,5: 2x2
# ".split("\n")

grid = []

lines.each do |line|
  _, id, col, row, width, height = line.split(/[#@,:x]/).map(&:to_i)

  row.upto(row + height - 1).each do |r|
    col.upto(col + width - 1).each do |c|
      grid[r] ||= []
      grid[r][c] = grid[r][c] ? "X" : "C"
    end
  end
end

p grid.join.count("X")
