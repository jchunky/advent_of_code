module Year2017
  module Day1
    class Problem1 < Problem
      def self.test_result
        1089
      end

      def result
        input.length.times
          .select { |i| input[i] == input[(i + 1) % input.length] }
          .sum { |i| input[i].to_i } # ?, 1089, ?
      end
    end
  end
end
