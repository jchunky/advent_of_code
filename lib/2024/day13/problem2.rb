module Year2024
  module Day13
    class Problem2 < Problem
      class Delta < Struct.new(:x, :y)
        def +(other)
          Delta.new(x + other.x, y + other.y)
        end

        def *(n)
          Delta.new(x * n, y * n)
        end
      end

      class Machine < Struct.new(:button_a, :button_b, :prize)
        def solution
          m, n = solve_m_and_n(button_a, button_b, prize)
          if (button_a * m) + (button_b * n) == prize
            (m * 3) + n
          else
            0
          end
        end

        # m * ax + n * bx = sx
        # m * ay + n * by = sy
        def solve_m_and_n(vector_a, vector_b, vector_sum)
          ax = vector_a.x
          ay = vector_a.y
          bx = vector_b.x
          by = vector_b.y
          sx = vector_sum.x
          sy = vector_sum.y

          n = ((sy * ax) - (sx * ay)) / ((by * ax) - (bx * ay))
          m = (sx - (n * bx)) / ax

          [m, n]
        end
      end

      def self.test_input
        "Button A: X+94, Y+34
Button B: X+22, Y+67
Prize: X=8400, Y=5400

Button A: X+26, Y+66
Button B: X+67, Y+21
Prize: X=12748, Y=12176

Button A: X+17, Y+86
Button B: X+84, Y+37
Prize: X=7870, Y=6450

Button A: X+69, Y+23
Button B: X+27, Y+71
Prize: X=18641, Y=10279
"
      end

      def self.test_result
        875318608908
      end

      def result
        input
          .split("\n\n")
          .map { |lines| build_machine(lines) }
          .sum(&:solution)
      end

      def build_machine(lines)
        button_a, button_b, prize = lines.split("\n").map.with_index do |line, i|
          x, y = line.scan(/\d+/).map(&:to_i)
          x += 10000000000000 if i == 2
          y += 10000000000000 if i == 2
          Delta.new(x, y)
        end
        Machine.new(button_a, button_b, prize)
      end
    end
  end
end
