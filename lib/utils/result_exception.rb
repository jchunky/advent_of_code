class ResultException < StandardError
  attr_reader :value

  def initialize(value)
    super("result: #{value}")
    @value = value
  end
end
