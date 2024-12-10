module Year2015
  module Day3
    class Problem1 < Problem
      def self.test_input
        "^>v<"
      end

      def self.test_result
        4
      end

      def result
        position = [0, 0]
        visits = Hash.new(0)
        visits[position.to_s] += 1
        input.chars.each do |c|
          case c
          when "^"
            position[0] += 1
          when "v"
            position[0] -= 1
          when ">"
            position[1] += 1
          when "<"
            position[1] -= 1
          end
          visits[position.to_s] += 1
        end
        visits.keys.count
      end
    end
  end
end
