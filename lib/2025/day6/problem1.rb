module Year2025
  module Day6
    class Problem1 < Problem
      def self.test_input
        "123 328  51 64
 45 64  387 23
  6 98  215 314
*   +   *   +
"
      end

      def self.test_result
        4277556
      end

      def result
        lines.map(&:split).transpose.sum do |column|
          *rest, operation = column
          rest.map(&:to_i).reduce(&operation.to_sym)
        end
      end
    end
  end
end
