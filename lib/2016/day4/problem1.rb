module Year2016
  module Day4
    class Room < Struct.new(:encrypted_name, :sector_id_string, :checksum)
      def initialize(line)
        args = line.chomp.scan(/([a-z\-]+)(\d+)\[([a-z]+)\]/).flatten
        super(*args)
      end

      def real?
        chars = encrypted_name.delete("-").chars
        tally = chars.tally
        most_common_letters = chars.uniq.max_by(5) { |char| [tally[char], -char.ord] }.join
        checksum == most_common_letters
      end

      def sector_id
        sector_id_string.to_i
      end

      def decrypted_name
        encrypted_name.chars.map { |char| decrypt(char) }.join
      end

      def decrypt(char)
        return " " if char == "-"

        ("a".ord + ((char.ord - "a".ord + sector_id) % 26)).chr
      end

      def to_s
        "#{decrypted_name}: #{sector_id}"
      end
    end

    class Problem1 < Problem
      def self.test_input
        "aaaaa-bbb-z-y-x-123[abxyz]
a-b-c-d-e-f-g-h-987[abcde]
not-a-real-room-404[oarel]
totally-real-room-200[decoy]
"
      end

      def self.test_result
        1514
      end

      def result
        lines
          .map { |line| Room.new(line) }
          .select(&:real?)
          .sum(&:sector_id)
      end
    end
  end
end
