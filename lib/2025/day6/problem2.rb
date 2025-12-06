module Year2025
  module Day6
    class Problem2 < Problem
      def self.test_input
        "123 328  51 64
 45 64  387 23
  6 98  215 314
*   +   *   +
"
      end

      def self.test_result
        3263827
      end

      class Solver < Struct.new(:lines)
        def solve
          lines
            .map { slice_on_indexes(it) }
            .transpose
            .map(&method(:calculate))
            .sum
        end

        private

        def calculate(column)
          *rest, operation = column
          operation = operation.strip.to_sym
          max_length = rest.map(&:length).max

          rest
            .map { it.ljust(max_length) }
            .map(&:chars)
            .transpose
            .map { it.join.delete(' ').to_i }
            .reject(&:zero?)
            .reduce(&operation)
        end

        def slice_on_indexes(line)
          line.chars.each_with_index
            .slice_before { |_, i| indexes.include?(i) }
            .map { it.map(&:first) }
            .map(&:join)
        end

        def indexes
          @indexes ||= (1...lines.last.length).to_a.select { |i| lines.last[i] != ' ' }
        end
      end

      def result
        Solver.new(lines).solve
      end
    end
  end
end
