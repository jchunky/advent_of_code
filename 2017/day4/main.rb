require "active_support/all"

def valid?(pass_phrase)
  words = pass_phrase.chomp.split
  words.count == words.uniq.count
end

def improved_valid?(pass_phrase)
  words = pass_phrase.chomp.split

  words.count == words.uniq.count &&
    words.combination(2).none? { |a, b| a.chars.sort == b.chars.sort }
end

lines = File.readlines("input.txt")

p(lines.count { |l| valid?(l) }) # 451

p(lines.count { |l| improved_valid?(l) }) # 451
