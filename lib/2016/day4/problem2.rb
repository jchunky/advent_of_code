module Year2016
  module Day4
    class Problem2 < Problem
      def self.test_input
        "aaaaa-bbb-z-y-x-123[abxyz]
a-b-c-d-e-f-g-h-987[abcde]
not-a-real-room-404[oarel]
totally-real-room-200[decoy]
bcfhvdczs-cpxsqh-ghcfous-324[chsfb]
"
      end

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
