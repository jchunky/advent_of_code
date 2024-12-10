module Year2017
  module Day3
    class Problem1 < Problem
      def result
        square_index = 312051
        # square_index = 1024

        vector = Vector.new
        grid = SparseGrid.new
        (1..square_index - 1).each do |index|
          grid.place_content_at(vector.position, index)
          vector.turn_left unless grid.include?(vector.left_position)
          vector.step
        end
        [vector.position.row, vector.position.col].sum(&:abs) # 31, 430
      end
    end
  end
end
