require "active_support/all"

DUPLICATES = ("a".."z").map { |l| l * 2 }
BANNED = %w[ab cd pq xy]

def nice?(string)
  enough_vowels = string.chars.count { |c| %w[a e i o u].include?(c) } >= 3
  duplicate = DUPLICATES.any? { |d| string.include?(d) }
  banned = BANNED.any? { |b| string.include?(b) }
  enough_vowels && duplicate && !banned
end

def improved_nice?(string)
  duplicate_pair?(string) && pair_sandwich?(string)
end

def duplicate_pair?(string)
  0.upto(string.length - 3).any? { |i| string[i + 2..].include?(string[i, 2]) }
end

def pair_sandwich?(string)
  0.upto(string.length - 3).any? { |i| string[i] == string[i + 2] }
end

strings = File.readlines("input.txt").map(&:chomp)

p(strings.count { |s| nice?(s) }) # 258

p(strings.count { |s| improved_nice?(s) }) # 53
