module Year2017
  module Day3
    class Problem2 < Problem
      def self.test_input
        "1024"
      end

      def self.test_result
        1968
      end

      def result
        square_index = input.to_i
        vector = Vector.new
        grid = SparseGrid.new
        (1..).each do |index|
          sum = index == 1 ? 1 : vector.position.adjacent_positions.sum { |p| grid.content_of(p) }
          raise(ResultException, sum) if sum > square_index

          grid.place_content_at(vector.position, sum)
          vector.turn_left unless grid.include?(vector.left_position)
          vector.step
        end
      end
    end
  end
end
