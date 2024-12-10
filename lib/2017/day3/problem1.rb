module Year2017
  module Day3
    class Problem1 < Problem
      def self.test_input
        "1024"
      end

      def self.test_result
        31
      end

      def result
        square_index = input.to_i

        vector = Vector.new
        grid = SparseGrid.new
        (1..square_index - 1).each do |index|
          grid.place_content_at(vector.position, index)
          vector.turn_left unless grid.include?(vector.left_position)
          vector.step
        end
        [vector.position.row, vector.position.col].sum(&:abs)
      end
    end
  end
end
