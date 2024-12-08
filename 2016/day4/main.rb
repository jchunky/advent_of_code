require "active_support/all"

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

lines = File.readlines("input.txt")
sector_id_sum = lines
  .map { |line| Room.new(line) }
  .select(&:real?)
  .sum(&:sector_id)
p sector_id_sum

decrypted_names = lines
  .map { |line| Room.new(line) }
  .select(&:real?)
  .select { |room| room.decrypted_name.include?("north") }
  .map(&:to_s)
pp decrypted_names # 324
