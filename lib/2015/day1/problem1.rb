module Year2015
  module Day1
    class Problem1 < Problem
      def self.test_result
        280
      end

      def result
        input.count("(") - input.count(")")
      end
    end
  end
end
