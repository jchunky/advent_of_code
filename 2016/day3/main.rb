require "active_support/all"

lines = File.readlines("input.txt")
# lines = "101 301 501
# 102 302 502
# 103 303 503
# 201 401 601
# 202 402 602
# 203 403 603
# ".split("\n")

possible_triangle_count =
  lines.count do |line|
    a, b, c = line.split.map(&:to_i).sort
    a + b > c
  end
p possible_triangle_count

possible_triangle_count =
  lines
    .map { |line| line.split.map(&:to_i) }
    .transpose
    .sum do |column|
      column.each_slice(3).count do |triple|
        a, b, c = triple.sort
        a + b > c
      end
    end
p possible_triangle_count
