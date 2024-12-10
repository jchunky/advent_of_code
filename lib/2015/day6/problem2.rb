module Year2015
  module Day6
    class Problem2 < Problem
      def result
        instructions = lines
        grid = Array.new(1000) { [0] * 1000 }
        instructions.each { |i| process(grid, i) }
        grid.sum(&:sum)
      end

      def process(grid, instruction)
        a, b, c, d = instruction.scan(/\d+/).map(&:to_i)
        case instruction
        when /toggle/
          (a..c).each do |r|
            (b..d).each do |c|
              grid[r][c] += 2
            end
          end
        when /turn on/
          (a..c).each do |r|
            (b..d).each do |c|
              grid[r][c] += 1
            end
          end
        when /turn off/
          (a..c).each do |r|
            (b..d).each do |c|
              grid[r][c] -= 1
              grid[r][c] = grid[r][c].clamp(0..)
            end
          end
        end
      end
    end
  end
end
