module Year2024
  module Day4
    class Problem2 < Problem
      def result
        rows = lines.map(&:chars)
        row_count = rows.count
        col_count = rows.first.count

        word = "MAS"
        words = [word, word.reverse]
        falling_diagonal = [[0, 0], [1, 1], [2, 2]]
        rising_diagonal = [[2, 0], [1, 1], [0, 2]]
        words.product(words).sum do |word1, word2|
          row_count.times.sum do |r|
            col_count.times.count do |c|
              found_falling_diagonal = find_word?(rows, r, c, falling_diagonal, word1)
              found_rising_diagonal = find_word?(rows, r, c, rising_diagonal, word2)

              found_falling_diagonal && found_rising_diagonal
            end
          end
        end
        # 2046
      end

      def find_word?(rows, r, c, coords, word)
        coords.each.with_index.all? do |(row_delta, col_delta), i|
          rows.dig(r + row_delta, c + col_delta) == word[i]
        end
      end
    end
  end
end
