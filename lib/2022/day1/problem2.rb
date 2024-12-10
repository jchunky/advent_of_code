module Year2022
  module Day1
    class Problem2 < Problem
      def self.test_result
        211189
      end

      def result
        input.split("\n\n").map { |elf| elf.split("\n").sum(&:to_i) }.max(3).sum # 211189
      end
    end
  end
end
