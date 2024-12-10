module Year2017
  module Day1
    class Problem2 < Problem
      def self.test_input
        "12131415"
      end

      def self.test_result
        4
      end

      def result
        input.length.times
          .select { |i| input[i] == input[(i + (input.length / 2)) % input.length] }
          .sum { |i| input[i].to_i }
      end
    end
  end
end
