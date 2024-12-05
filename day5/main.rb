require "active_support/all"

def correct_by_rule?(rule, update)
  i, j = rule.map { |n| update.index(n) }
  !i || !j || i < j
end

def correct?(rules, update)
  rules.all? { |r| correct_by_rule?(r, update) }
end

def middle(array)
  array[array.length / 2]
end

def find_correct_permutation(rules, update)
  count = update.length
  update = update.dup
  result = []
  rules = rules.select { |a, b| update.include?(a) && update.include?(b) }
  while result.length < count
    next_number = update.find { |n| rules.map(&:last).exclude?(n) }
    result << next_number
    update.delete(next_number)
    rules = rules.reject { |a, b| a == next_number }
  end
  result
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
