require "active_support/all"

count = 0

rows = File.readlines("input.txt")
count += rows.sum { |row| row.scan("XMAS").count }
count += rows.sum { |row| row.scan("SAMX").count }

cols = rows.map(&:chomp).map(&:chars).transpose.map(&:join)
count += cols.sum { |col| col.scan("XMAS").count }
count += cols.sum { |col| col.scan("SAMX").count }

rows = rows.map(&:chomp).map(&:chars)
cols = rows.transpose
count +=
  rows.count.times.sum do |r|
    cols.count.times.count do |c|
      rows.dig(r, c) == "X" &&
        rows.dig(r + 1, c + 1) == "M" &&
        rows.dig(r + 2, c + 2) == "A" &&
        rows.dig(r + 3, c + 3) == "S"
    end
  end
count +=
  rows.count.times.sum do |r|
    cols.count.times.count do |c|
      rows.dig(r, c) == "S" &&
        rows.dig(r + 1, c + 1) == "A" &&
        rows.dig(r + 2, c + 2) == "M" &&
        rows.dig(r + 3, c + 3) == "X"
    end
  end
count +=
  rows.count.times.sum do |r|
    cols.count.times.count do |c|
      rows.dig(r + 3, c) == "X" &&
        rows.dig(r + 2, c + 1) == "M" &&
        rows.dig(r + 1, c + 2) == "A" &&
        rows.dig(r + 0, c + 3) == "S"
    end
  end
count +=
  rows.count.times.sum do |r|
    cols.count.times.count do |c|
      rows.dig(r + 3, c) == "S" &&
        rows.dig(r + 2, c + 1) == "A" &&
        rows.dig(r + 1, c + 2) == "M" &&
        rows.dig(r + 0, c + 3) == "X"
    end
  end

p count # 2718

count = 0

count +=
  rows.count.times.sum do |r|
    cols.count.times.count do |c|
      rows.dig(r + 2, c + 0) == "S" &&
        rows.dig(r + 1, c + 1) == "A" &&
        rows.dig(r + 0, c + 2) == "M" &&
        rows.dig(r + 0, c + 0) == "S" &&
        rows.dig(r + 2, c + 2) == "M"
    end
  end
count +=
  rows.count.times.sum do |r|
    cols.count.times.count do |c|
      rows.dig(r + 2, c + 0) == "M" &&
        rows.dig(r + 1, c + 1) == "A" &&
        rows.dig(r + 0, c + 2) == "S" &&
        rows.dig(r + 0, c + 0) == "S" &&
        rows.dig(r + 2, c + 2) == "M"
    end
  end
count +=
  rows.count.times.sum do |r|
    cols.count.times.count do |c|
      rows.dig(r + 2, c + 0) == "S" &&
        rows.dig(r + 1, c + 1) == "A" &&
        rows.dig(r + 0, c + 2) == "M" &&
        rows.dig(r + 0, c + 0) == "M" &&
        rows.dig(r + 2, c + 2) == "S"
    end
  end
count +=
  rows.count.times.sum do |r|
    cols.count.times.count do |c|
      rows.dig(r + 2, c + 0) == "M" &&
        rows.dig(r + 1, c + 1) == "A" &&
        rows.dig(r + 0, c + 2) == "S" &&
        rows.dig(r + 0, c + 0) == "M" &&
        rows.dig(r + 2, c + 2) == "S"
    end
  end

p count # 2046
