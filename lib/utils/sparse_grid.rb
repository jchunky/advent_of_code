class SparseGrid < Struct.new(:positions)
  delegate :include?, to: :positions

  def initialize
    super({})
  end

  def content_of(position)
    positions[position] || 0
  end

  def place_content_at(position, content)
    positions[position] = content
  end
end
