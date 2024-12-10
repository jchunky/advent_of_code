module Year2024
  module Day4
    class Problem1 < Problem
      def result
        rows = lines.map(&:chars)
        row_count = rows.count
        col_count = rows.first.count

        directions = [
          [[0, 0], [0, 1], [0, 2], [0, 3]], # horizontal line
          [[0, 0], [1, 0], [2, 0], [3, 0]], # vertical line
          [[0, 0], [1, 1], [2, 2], [3, 3]], # falling diagonal
          [[3, 0], [2, 1], [1, 2], [0, 3]], # rising diagonal
        ]
        word = "XMAS"
        words = [word, word.reverse]
        words.sum do |word|
          directions.sum do |coords|
            row_count.times.sum do |r|
              col_count.times.count do |c|
                find_word?(rows, r, c, coords, word)
              end
            end
          end
        end
        # 2718
      end

      def find_word?(rows, r, c, coords, word)
        coords.each.with_index.all? do |(row_delta, col_delta), i|
          rows.dig(r + row_delta, c + col_delta) == word[i]
        end
      end
    end
  end
end
