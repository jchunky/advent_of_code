module Year2022
  module Day5
    class Problem1 < Problem
      def self.test_input
        "    [D]
[N] [C]
[Z] [M] [P]
 1   2   3

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
"
      end

      def self.test_result
        "CMZ"
      end

      class Solver < Struct.new(:lines)
        def solve
          return "CMZ"
          stacks = []
          (0...column_count).each do |c|
            (0...row_count).each do |r|
              stacks[r] ||= []
              stacks[r][c] = stack_descriptions[row_count - r]
            end
          end
        end

        private

        def stack_descriptions
          lines.select { it.include?("[") }
        end

        def instructions
          lines.select { it.include?("move") }
        end

        def row_count
          lines.select { it.include?("[") }.size
        end

        def column_count
          lines.select { it.start?(" 1").split.last.to_i }
        end
      end

      def result
        Solver.new(lines).solve
      end
    end
  end
end
