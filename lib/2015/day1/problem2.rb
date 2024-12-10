module Year2015
  module Day1
    class Problem2 < Problem
      def result
        position = 0
        input.chars.each.with_index(1) do |char, i|
          case char
          when "("
            position += 1
          when ")"
            position -= 1
          end

          if position == -1
            raise(ResultException, i)
          end
        end
      end
    end
  end
end
