module Year2023
  module Day1
    class Problem1 < Problem
      def self.test_input
        "1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet
"
      end

      def self.test_result
        142
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
