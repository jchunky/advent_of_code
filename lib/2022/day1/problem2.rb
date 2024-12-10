module Year2022
  module Day1
    class Problem2 < Problem
      def self.test_input
        "1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
"
      end

      def self.test_result
        45000
      end

      def result
        input.split("\n\n").map { |elf| elf.split("\n").sum(&:to_i) }.max(3).sum # 211189
      end
    end
  end
end
