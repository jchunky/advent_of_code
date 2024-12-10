module Year2016
  module Day2
    class Problem2 < Problem
      class Main < Struct.new(:lines, :buttons, :row, :col)
        def self.solve_problem(lines)
          buttons = [
            [nil, nil, nil, nil, nil, nil, nil],
            [nil, nil, nil, "1", nil, nil, nil],
            [nil, nil, "2", "3", "4", nil, nil],
            [nil, "5", "6", "7", "8", "9", nil],
            [nil, nil, "A", "B", "C", nil, nil],
            [nil, nil, nil, "D", nil, nil, nil],
            [nil, nil, nil, nil, nil, nil, nil],
          ]
          new(lines, buttons, row: 3, col: 1).solve
        end

        def initialize(lines, buttons, row:, col:)
          #     lines = "ULL
          # RRDDD
          # LURDL
          # UUUUD
          # "
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

      def result
        Main.solve_problem(lines) # 5DB3, 57DD8
      end
    end
  end
end
