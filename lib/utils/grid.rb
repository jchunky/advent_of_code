class Grid < Struct.new(:rows)
  def find_regions
    processed = dup
    regions = {}

    (0...rows.size).each do |r|
      (0...rows.first.size).each do |c|
        position = Position.new(r, c)
        next if processed.content_at?(".", position)

        region = find_region(position)
        regions[content_of(position)] = region
        region.positions.each { |p| processed.place_content_at(".", p) }
      end
    end

    regions
  end

  def find_region(position)
  end

  def find_content(content)
    each_position.find { |position| content_of(position) == content }
  end

  def find_all(content)
    each_position.select { |position| content_of(position) == content }
  end

  def content_at?(content, position)
    content_of(position) == content
  end

  def content_of(position)
    return unless include?(position)

    rows.dig(position.row, position.col)
  end

  def place_content_at(content, position)
    return unless include?(position)

    rows[position.row][position.col] = content
  end

  def include?(position)
    (0...rows.size).cover?(position.row) && (0...rows.first.size).cover?(position.col)
  end

  def dup
    self.class.new(rows.map(&:dup))
  end

  def each_position
    return enum_for(:each_position) unless block_given?

    0.upto(rows.size - 1).each do |row|
      0.upto(rows.first.size - 1).each do |col|
        yield Position.new(row, col)
      end
    end
  end
end
