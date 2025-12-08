class Array
  def first_half
    first(size / 2)
  end

  def last_half
    last(size / 2)
  end
end

module Year2020
  module Day5
    class Problem2 < Problem
      def self.test_input
        "FBFBBFFRLR
"
      end

      def self.test_result
        357
      end

      def result
        seats = lines.map do |line|
          chars = line.chars

          row = (0..127).to_a
          chars.first(7).each do |r|
            row = ((r == 'F') ? row.first_half : row.last_half)
          end

          col = (0..7).to_a
          chars.last(3).each do |c|
            col = ((c == 'L') ? col.first_half : col.last_half)
          end

          row.first * 8 + col.first
        end.max

        # (seats.min..seats.max).to_a - seats
      end
    end
  end
end
