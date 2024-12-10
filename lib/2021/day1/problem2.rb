module Year2021
  module Day1
    class Problem2 < Problem
      def self.test_input
        "199
200
208
210
200
207
240
269
260
263
"
      end

      def self.test_result
        5
      end

      def result
        lines.map(&:to_i).each_cons(3).map(&:sum).each_cons(2).count { |a, b| a < b }
      end
    end
  end
end
