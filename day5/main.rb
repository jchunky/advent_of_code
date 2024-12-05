require "active_support/all"

def correct_by_rule?(rule, update)
  a, b = rule
  a_index = update.index(a)
  b_index = update.index(b)
  return true unless a_index
  return true unless b_index

  a_index < b_index
end

def correct?(rules, update)
  rules.all? { |r| correct_by_rule?(r, update) }
end

def middle(update)
  update[update.length / 2]
end

rules, updates = File.read("input.txt").split("\n\n")
rules = rules.split("\n").map { |r| r.split("|").map(&:to_i) }
updates = updates.split("\n").map { |u| u.split(",").map(&:to_i) }

result =
  updates
    .select { |u| correct?(rules, u) }
    .sum { |u| middle(u) }

p result # 5588
