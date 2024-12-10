module Year2022
  module Day1
    class Problem2 < Problem
      def result
        input.split("\n\n").map { |elf| elf.split("\n").sum(&:to_i) }.max(3).sum # 211189
      end
    end
  end
end
