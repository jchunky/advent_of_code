module Year2017
  module Day1
    class Problem1 < Problem
      def self.test_input
        "91212129"
      end

      def self.test_result
        9
      end

      def result
        input.length.times
          .select { |i| input[i] == input[(i + 1) % input.length] }
          .sum { |i| input[i].to_i }
      end
    end
  end
end
