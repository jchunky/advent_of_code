module Year2021
  module Day1
    class Problem1 < Problem
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
        7
      end

      def result
        lines.map(&:to_i).each_cons(2).count { |a, b| a < b } # 1715
      end
    end
  end
end
