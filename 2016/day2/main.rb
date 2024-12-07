require "active_support/all"

class Main < Struct.new(:lines, :buttons, :row, :col)
  def self.solve_problem1
    buttons = [
      [nil, nil, nil, nil, nil],
      [nil, "1", "2", "3", nil],
      [nil, "4", "5", "7", nil],
      [nil, "7", "8", "9", nil],
      [nil, nil, nil, nil, nil],
    ]
    p new(buttons, row: 2, col: 2).solve
  end

  def self.solve_problem2
    buttons = [
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, "1", nil, nil, nil],
      [nil, nil, "2", "3", "4", nil, nil],
      [nil, "5", "6", "7", "8", "9", nil],
      [nil, nil, "A", "B", "C", nil, nil],
      [nil, nil, nil, "D", nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil],
    ]
    p new(buttons, row: 3, col: 1).solve
  end

  def initialize(buttons, row:, col:)
    lines = File.read("input.txt")
    #     lines = "ULL
    # RRDDD
    # LURDL
    # UUUUD
    # "
    super(lines.split("\n").map(&:chomp), buttons, row, col)
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

Main.solve_problem1 # 1985, 78985
Main.solve_problem2 # 5DB3, 57DD8
