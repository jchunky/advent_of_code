require "active_support/all"

def find_word?(rows, r, c, coords, word)
  coords.each.with_index.all? do |(row_delta, col_delta), i|
    rows.dig(r + row_delta, c + col_delta) == word[i]
  end
end

rows = File.readlines("input.txt").map(&:chomp).map(&:chars)
row_count = rows.count
col_count = rows.first.count

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
    row_count.times.sum do |r|
      col_count.times.count do |c|
        find_word?(rows, r, c, coords, "XMAS")
      end
    end
  end
p count # 2718

word = "MAS"
words = [word, word.reverse]
count =
  words.product(words).sum do |word1, word2|
    row_count.times.sum do |r|
      col_count.times.count do |c|
        coords1 = [[0, 0], [1, 1], [2, 2]]
        found1 = find_word?(rows, r, c, coords1, word1)

        coords2 = [[2, 0], [1, 1], [0, 2]]
        found2 = find_word?(rows, r, c, coords2, word2)

        found1 && found2
      end
    end
  end
p count # 2046
