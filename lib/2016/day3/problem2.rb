module Year2016
  module Day3
    class Problem2 < Problem
      def self.test_input
        "101 301 501
102 302 502
103 303 503
201 401 601
202 402 602
203 403 603
"
      end

      def self.test_result
        6
      end

      def result
        lines
          .map { |line| line.split.map(&:to_i) }
          .transpose
          .sum do |column|
            column.each_slice(3).count do |triple|
              a, b, c = triple.sort
              a + b > c
            end
          end
      end
    end
  end
end
