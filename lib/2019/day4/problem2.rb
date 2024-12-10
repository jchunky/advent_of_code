module Year2019
  module Day4
    class Problem2 < Problem
      def result
        input = (231832..767346)

        input.count do |n|
          digits = n.to_s.chars

          digits.dup.prepend(nil).append(nil).each_cons(4).any? do |a, b, c, d|
            a != b && b == c && c != d
          end &&
            (digits == digits.sort)
        end
        # 876
      end
    end
  end
end
