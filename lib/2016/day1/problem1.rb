module Year2016
  module Day1
    class Problem1 < Problem
      def result
        instructions = input

        bearing = %i[north east south west]
        position = [0, 0]
        instructions.split(", ").each do |instruction|
          turn, *steps = instruction.chars
          steps = steps.join.to_i
          case turn
          when "L" then bearing.rotate!(-1)
          when "R" then bearing.rotate!(+1)
          end
          case bearing.first
          when :north then position[0] += steps
          when :east then position[1] += steps
          when :south then position[0] -= steps
          when :west then position[1] -= steps
          end
        end
        position.sum(&:abs)
      end
    end
  end
end
