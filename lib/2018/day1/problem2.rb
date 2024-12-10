module Year2018
  module Day1
    class Problem2 < Problem
      def result
        frequency = 0
        seen = {}
        lines.map(&:to_i).cycle.each do |delta|
          frequency += delta
          raise(ResultException, frequency) if seen.include?(frequency)

          seen[frequency] = true
        end
      end
    end
  end
end
