module Year2015
  module Day6
    class Problem1 < Problem
      def self.test_result
        543903
      end

      def result
        instructions = lines
        grid = Array.new(1000) { [false] * 1000 }
        instructions.each { |i| process(grid, i) }
        grid.sum { |r| r.count(true) }
      end

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
    end
  end
end
