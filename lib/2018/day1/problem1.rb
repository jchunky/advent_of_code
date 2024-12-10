module Year2018
  module Day1
    class Problem1 < Problem
      def self.test_input
        "+1
-2
+3
+1
"
      end

      def self.test_result
        3
      end

      def result
        lines = input

        eval(lines.delete("\n")) # 587
      end
    end
  end
end
