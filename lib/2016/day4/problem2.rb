module Year2016
  module Day4
    class Problem2 < Problem
      def result
        lines
          .map { |line| Room.new(line) }
          .select(&:real?)
          .select { |room| room.decrypted_name.include?("north") }
          .map(&:to_s)
        # 324
      end
    end
  end
end
