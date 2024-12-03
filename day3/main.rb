require "active_support/all"

sum = File.read("input.txt")
  .scan(/mul\((\d+),(\d+)\)/)
  .map { |a| a.map(&:to_i) }
  .sum { |a, b| a * b }

p sum

elements = File.read("input.txt")
  .scan(/(mul\(\d+,\d+\)|do\(\)|don't\(\))/)
  .flatten

enabled = true
result = 0
elements.each do |element|
  case element
  when /mul/
    result += element.scan(/(\d+),(\d+)/).flatten.map(&:to_i).reduce(:*) if enabled
  when /don't/
    enabled = false
  when /do/
    enabled = true
  end
end

p result
