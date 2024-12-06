require "active_support/all"

instructions = File.readlines("input.txt")

def process(grid, instruction)
  a, b, c, d = instruction.scan(/\d+/).map(&:to_i)
  case instruction
  when /toggle/
    (a..c).each do |r|
      (b..d).each do |c|
        grid[r][c] = !grid[r][c]
      end
    end
  when /turn on/
    (a..c).each do |r|
      (b..d).each do |c|
        grid[r][c] = true
      end
    end
  when /turn off/
    (a..c).each do |r|
      (b..d).each do |c|
        grid[r][c] = false
      end
    end
  end
end

grid = Array.new(1000) { [false] * 1000 }

instructions.each { |i| process(grid, i) }

p(grid.sum { |r| r.count(true) })
