require "active_support/all"

def match?(equation)
  left_total, numbers = equation.split(":")
  left_total = left_total.to_i
  numbers = numbers.split.map(&:to_i)
  operator_permutations = %i[+ * ||].repeated_permutation(numbers.count - 1)
  operator_permutations.any? do |operator_permutation|
    first, *rest = numbers
    right_total = first
    operator_permutation.zip(rest).each do |operator, number|
      right_total = if operator == :"||"
                      (right_total.to_s + number.to_s).to_i
                    else
                      right_total.send(operator, number)
                    end
    end
    right_total == left_total
  end
end

def total_of(equation)
  equation.to_i
end

equations = File.readlines("input.txt").map(&:chomp)
result =
  equations
    .select { |e| match?(e) }
    .sum { |e| total_of(e) }

p result
