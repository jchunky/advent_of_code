module Year2015
  module Day3
    class Problem2 < Problem
      def self.test_input
        "^>v<"
      end

      def self.test_result
        3
      end

      def result
        santa_position = [0, 0]
        robo_position = [0, 0]
        visits = Hash.new(0)
        visits[santa_position.to_s] += 1
        visits[robo_position.to_s] += 1
        input.chars.each.with_index(1) do |c, i|
          position = i.odd? ? santa_position : robo_position
          case c
          when "^" then position[0] += 1
          when "v" then position[0] -= 1
          when ">" then position[1] += 1
          when "<" then position[1] -= 1
          end
          visits[position.to_s] += 1
        end
        visits.keys.count # 2341
      end
    end
  end
end
