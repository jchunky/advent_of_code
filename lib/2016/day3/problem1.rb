module Year2016
  module Day3
    class Problem1 < Problem
      def result
        # lines = "101 301 501
        # 102 302 502
        # 103 303 503
        # 201 401 601
        # 202 402 602
        # 203 403 603
        # ".split("\n")

        lines.count do |line|
          a, b, c = line.split.map(&:to_i).sort
          a + b > c
        end
      end
    end
  end
end
