require "active_support/all"

def valid?(pass_phrase)
  words = pass_phrase.chomp.split
  words.count == words.uniq.count
end

lines = File.readlines("input.txt")

p(lines.count { |l| valid?(l) }) # 451
