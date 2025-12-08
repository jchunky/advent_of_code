module Year2021
  module Day4
    class Problem2 < Problem
      def self.test_input
        "7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1

22 13 17 11  0
 8  2 23  4 24
21  9 14 16  7
 6 10  3 18  5
 1 12 20 15 19

 3 15  0  2 22
 9 18 13 17  5
19  8  7 25 23
20 11 10 24  4
14 21 16 12  6

14 21 17 24  4
10 16 15  9 19
18  8 23 26 20
22 11 13  6  5
 2  0 12  3  7
"
      end

      def self.test_result
        1924
      end

      def result
        numbers, *boards = input.split("\n\n")
        numbers = numbers.split(",").map(&:to_i)
        boards = boards.map do |board|
          board.split("\n").map do |line|
            line.split.map(&:to_i)
          end
        end

        loop do
          number = numbers.shift
          last_to_win = boards.find { !winner?(it) }
          boards.each do |board|
            mark_board(board, number)
          end
          all_won = boards.all?(&method(:winner?))
          return score(last_to_win) * number if all_won
        end
      end

      def mark_board(board, number)
        (0...board.size).each do |r|
          (0...board[0].size).each do |c|
            board[r][c] = 'x' if board[r][c] == number
          end
        end
      end

      def winner?(board)
        board.any? { it.uniq.one? } ||
          board.transpose.any? { it.uniq.one? }
      end

      def score(board)
        board.flatten.map(&:to_i).sum
      end
    end
  end
end
