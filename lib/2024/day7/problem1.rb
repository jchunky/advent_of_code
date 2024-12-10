module Year2024
  module Day7
    class Problem1 < Problem
      def self.test_result
        1430271835320
      end

      def result
        equations = lines

        operators = [
          ->(a, b) { a + b },
          ->(a, b) { a * b },
        ]
        equations
          .select { |e| match?(operators, e) }
          .sum { |e| total_of(e) }
        # 1430271835320
      end

      def match?(operators, equation)
        left_total, numbers = equation.split(":")
        left_total = left_total.to_i
        numbers = numbers.split.map(&:to_i)
        operator_permutations = operators.repeated_permutation(numbers.count - 1)
        operator_permutations.any? do |operator_permutation|
          first, *rest = numbers
          right_total = first
          operator_permutation.zip(rest).each do |operator, number|
            right_total = operator.call(right_total, number)
          end
          right_total == left_total
        end
      end

      def total_of(equation)
        equation.to_i
      end
    end
  end
end
