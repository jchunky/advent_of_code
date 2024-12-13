module Year2024
  module Day13
    class Problem1 < Problem
      class Delta < Struct.new(:x, :y)
        def +(other)
          Delta.new(x + other.x, y + other.y)
        end

        def -(other)
          Delta.new(x - other.x, y - other.y)
        end

        def *(n)
          Delta.new(x * n, y * n)
        end

        def <(other)
          x < other.x && y < other.y
        end

        def /(other)
          raise "#{self} not divisble by #{other}" unless divisible_by?(other)

          x / other.x
        end

        def negative?
          x.negative? || y.negative?
        end

        def divisible_by?(other)
          x % other.x == 0 && y % other.y == 0 && x / other.x == y / other.y
        end
      end

      class Machine < Struct.new(:button_a, :button_b, :prize)
        def solvable?
          solution
        end

        def solution
          (0..100)
            .map { |button_a_press_count| [button_a_press_count, find_button_b_press_count(button_a_press_count)] }
            .select { |_a, b| b }
            .map { |a, b| (a * 3) + b }
            .min
        end

        def find_button_b_press_count(button_a_press_count)
          button_a_total = button_a * button_a_press_count
          return 0 if button_a_total == prize

          delta = prize - button_a_total
          return false if delta.negative?
          return false unless button_b < delta
          return false unless delta.divisible_by?(button_b)

          delta / button_b
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
        480
      end

      def result
        input
          .split("\n\n")
          .map { |lines| build_machine(lines) }
          .select(&:solvable?)
          .sum(&:solution)
      end

      def build_machine(lines)
        button_a, button_b, prize = lines.split("\n").map do |line|
          x, y = line.scan(/\d+/).map(&:to_i)
          Delta.new(x, y)
        end
        Machine.new(button_a, button_b, prize)
      end
    end
  end
end
