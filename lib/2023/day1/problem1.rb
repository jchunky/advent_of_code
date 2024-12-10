module Year2023
  module Day1
    class Problem1 < Problem
      def self.test_result
        54159
      end

      def result
        lines.sum do |line|
          find_two_digits = line.scan(/^[a-z]*(\d).*(\d)[a-z]*$/).join
          find_one_digit = line.scan(/^[a-z]*(\d)/).join
          digits = find_two_digits == "" ? find_one_digit * 2 : find_two_digits
          digits.to_i
        end
      end
    end
  end
end
