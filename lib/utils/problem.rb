class Problem
  attr_reader :input

  def initialize(input)
    @input = input.chomp
  end

  def lines
    input.split("\n")
  end
end
