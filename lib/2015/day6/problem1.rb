module Year2015
  module Day6
    class Problem1 < Problem
      def self.test_input
        "toggle 461,550 through 564,900
turn off 370,39 through 425,839
turn off 464,858 through 833,915
turn off 812,389 through 865,874
turn on 599,989 through 806,993
turn on 376,415 through 768,548
turn on 606,361 through 892,600
turn off 448,208 through 645,684
toggle 50,472 through 452,788
toggle 205,417 through 703,826
"
      end

      def self.test_result
        204398
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
