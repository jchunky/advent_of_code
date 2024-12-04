require "active_support/all"

def find_word?(rows, r, c, coords, word)
  coords.each.with_index.all? do |(row_delta, col_delta), i|
    rows.dig(r + row_delta, c + col_delta) == word[i]
  end
end

rows = File.readlines("input.txt").map(&:chomp).map(&:chars)
cols = rows.transpose

directions = [
  [[0, 0], [0, 1], [0, 2], [0, 3]],
  [[0, 3], [0, 2], [0, 1], [0, 0]],
  [[0, 0], [1, 0], [2, 0], [3, 0]],
  [[3, 0], [2, 0], [1, 0], [0, 0]],
  [[0, 0], [1, 1], [2, 2], [3, 3]],
  [[3, 3], [2, 2], [1, 1], [0, 0]],
  [[3, 0], [2, 1], [1, 2], [0, 3]],
  [[0, 3], [1, 2], [2, 1], [3, 0]],
]
count =
  directions.sum do |coords|
    rows.count.times.sum do |r|
      cols.count.times.count do |c|
        find_word?(rows, r, c, coords, "XMAS")
      end
    end
  end
p count # 2718

word = "MAS"
words = [word, word.reverse]
count =
  words.product(words).sum do |word1, word2|
    rows.count.times.sum do |r|
      cols.count.times.count do |c|
        coords = [[0, 0], [1, 1], [2, 2]]
        first = find_word?(rows, r, c, coords, word2)

        coords = [[2, 0], [1, 1], [0, 2]]
        second = find_word?(rows, r, c, coords, word1)

        first && second
      end
    end
  end
p count # 2046
