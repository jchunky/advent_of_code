module Year2016
  module Day4
    class Problem2 < Problem
      def self.test_result
        324
      end

      def result
        lines
          .map { |line| Room.new(line) }
          .select(&:real?)
          .find { |room| room.decrypted_name.include?("north") }
          .sector_id
      end
    end
  end
end
