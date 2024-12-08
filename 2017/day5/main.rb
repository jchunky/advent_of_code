require "active_support/all"

lines = File.readlines("input.txt")

# lines = "0
# 3
# 0
# 1
# -3
# ".split("\n")

instructions = lines.map(&:to_i)
position = 0
steps = 0

# loop do
#   jump = instructions[position]
#   instructions[position] += 1
#   position += jump
#   steps += 1
#   abort(steps.to_s) unless (0...instructions.count).cover?(position) # 5, 355965
# end

loop do
  jump = instructions[position]
  increment = jump >= 3 ? -1 : 1
  instructions[position] += increment
  position += jump
  steps += 1
  abort(steps.to_s) unless (0...instructions.count).cover?(position) # 26948068
end
