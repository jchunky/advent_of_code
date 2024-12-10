module Year2022
  module Day1
    class Problem1 < Problem
      def self.test_result
        71471
      end

      def result
        input.split("\n\n").map { |elf| elf.split("\n").sum(&:to_i) }.max # 71471
      end
    end
  end
end
