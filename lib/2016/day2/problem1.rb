module Year2016
  module Day2
    class Problem1 < Problem
      class Main < Struct.new(:lines, :buttons, :row, :col)
        def self.solve_problem(lines)
          buttons = [
            [nil, nil, nil, nil, nil],
            [nil, "1", "2", "3", nil],
            [nil, "4", "5", "7", nil],
            [nil, "7", "8", "9", nil],
            [nil, nil, nil, nil, nil],
          ]
          new(lines, buttons, row: 2, col: 2).solve
        end

        def initialize(lines, buttons, row:, col:)
          super(lines, buttons, row, col)
        end

        def solve
          lines.map { |line|
            line.chars.each do |move|
              case move
              when "U" then (self.row = row - 1 if buttons[row - 1][col])
              when "D" then (self.row = row + 1 if buttons[row + 1][col])
              when "L" then (self.col = col - 1 if buttons[row][col - 1])
              when "R" then (self.col = col + 1 if buttons[row][col + 1])
              end
            end
            buttons[row][col]
          }.join
        end
      end

      def self.test_input
        "ULL
RRDDD
LURDL
UUUUD"
      end

      def self.test_result
        "1985"
      end

      def result
        Main.solve_problem(lines)
      end
    end
  end
end
