class Grid < Struct.new(:rows)
  def each_position
    return enum_for(:each_position) unless block_given?

    0.upto(rows.size - 1).each do |row|
      0.upto(rows.first.size - 1).each do |col|
        yield Position.new(row, col)
      end
    end
  end

  def content_of(position)
    return unless include?(position)

    rows.dig(position.row, position.col)
  end

  def include?(position)
    (0...rows.size).cover?(position.row) && (0...rows.first.size).cover?(position.col)
  end

  def place_content_at(position, content)
    return unless include?(position)

    rows[position.row][position.col] = content
  end
end
