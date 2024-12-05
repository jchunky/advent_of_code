require "active_support/all"

def correct?(rules, update)
  rules.all? { |r| correct_by_rule?(r, update) }
end

def correct_by_rule?(rule, update)
  i, j = rule.map { |n| update.index(n) }
  !i || !j || i < j
end

def middle(array)
  array[array.length / 2]
end

def find_correct_permutation(rules, update)
  update = update.dup
  rules = rules.select { |a, b| update.include?(a) && update.include?(b) }
  Array.new(update.length) do
    next_number = update.find { |n| rules.map(&:last).exclude?(n) }
    update.delete(next_number)
    rules = rules.reject { |a, b| a == next_number }
    next_number
  end
end

rules, updates = File.read("input.txt").split("\n\n")
rules = rules.split("\n").map { |r| r.split("|").map(&:to_i) }
updates = updates.split("\n").map { |u| u.split(",").map(&:to_i) }

result = updates
  .select { |u| correct?(rules, u) }
  .sum { |u| middle(u) }
p result # 5588

result = updates
  .reject { |u| correct?(rules, u) }
  .map { |u| find_correct_permutation(rules, u) }
  .sum { |u| middle(u) }
p result # 5331
