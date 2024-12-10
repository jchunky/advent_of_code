module Year2015
  module Day1
    class Problem1 < Problem
      def result
        input.count("(") - input.count(")")
      end
    end
  end
end
