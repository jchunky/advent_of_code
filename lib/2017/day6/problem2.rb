module Year2017
  module Day6
    class Problem2 < Problem
      def self.test_input
        "0 2 7 0
"
      end

      def self.test_result
        4
      end

      def result
        history = {}
        banks = input.split.map(&:to_i)
        cycles = 0
        loop do
          cycles += 1
          i = banks.index(banks.max)
          amount = banks[i]
          banks[i] = 0
          while amount > 0
            i = (i + 1) % banks.size
            banks[i] += 1
            amount -= 1
          end
          snapshot = banks.to_s
          return cycles - history[snapshot] if history[snapshot]
          history[snapshot] = cycles
        end
      end
    end
  end
end
