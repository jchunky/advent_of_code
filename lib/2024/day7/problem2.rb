module Year2024
  module Day7
    class Problem2 < Problem
      def self.test_input
        "190: 10 19
3267: 81 40 27
83: 17 5
156: 15 6
7290: 6 8 6 15
161011: 16 10 13
192: 17 8 14
21037: 9 7 18 13
292: 11 6 16 20"
      end

      def self.test_result
        11387
      end

      def result
        equations = lines

        operators = [
          ->(a, b) { a + b },
          ->(a, b) { a * b },
          ->(a, b) { (a.to_s + b.to_s).to_i },
        ]
        equations
          .select { |e| match?(operators, e) }
          .sum { |e| total_of(e) }
        # 456565678667482
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
