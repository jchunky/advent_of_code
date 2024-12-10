module Year2017
  module Day1
    class Problem2 < Problem
      def result
        input.length.times
          .select { |i| input[i] == input[(i + (input.length / 2)) % input.length] }
          .sum { |i| input[i].to_i } # ?, 1089, ?
      end
    end
  end
end
