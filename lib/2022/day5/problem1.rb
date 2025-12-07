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
          stacks = starting_stacks
          instructions.each do |instruction|
            count, from, to = instruction.scan(/\d+/)
            count, from, to = [count, from, to].map(&:to_i)
            from -= 1
            to -= 1

            count.times { stacks[to].push(stacks[from].pop) }
          end

          stacks.map(&:last).join
        end

        private

        def starting_stacks
          result = []
          (0...column_count).each do |c|
            (0...row_count).each do |r|
              value = stack_descriptions.fetch(r, [])[1 + 4 * c]
              result[c] ||= []
              result[c][row_count - r] = value
            end
          end
          result.map { it.join.strip.chars }
        end

        def stack_descriptions
          @stack_descriptions ||= lines.select { it.include?("[") }
        end

        def instructions
          @instructions ||= lines.select { it.include?("move") }
        end

        def row_count
          @row_count ||= lines.select { it.include?("[") }.size
        end

        def column_count
          @column_count ||= lines.find { it.start_with?(" 1") }.split.last.to_i
        end
      end

      def result
        Solver.new(lines).solve
      end
    end
  end
end
