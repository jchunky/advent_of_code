require "active_support/all"

lines = File.read("input.txt").split("\n")

# lines = "#1 @ 1,3: 4x4
# #2 @ 3,1: 4x4
# #3 @ 5,5: 2x2
# ".split("\n")

grid = []
claims = []

lines.each do |line|
  _, id, col, row, width, height = line.split(/[#@,:x]/).map(&:to_i)

  row.upto(row + height - 1).each do |r|
    col.upto(col + width - 1).each do |c|
      grid[r] ||= []
      if grid[r][c]
        claims << grid[r][c] if grid[r][c] != "X"
        claims << id
        grid[r][c] = "X"
      else
        grid[r][c] = id
      end
    end
  end
end

p grid.flatten.count("X") # 103482

claims = claims.uniq
p(grid.flatten.uniq.reject { |e| e == "X" || e.nil? || claims.include?(e) }) # 686
