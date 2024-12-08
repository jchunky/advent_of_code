require "active_support/all"

class Room < Struct.new(:encrypted_name, :sector_id_string, :checksum)
  def initialize(line)
    args = line.chomp.delete("-").scan(/([a-z]+)(\d+)\[([a-z]+)\]/).flatten
    super(*args)
  end

  def real?
    chars = encrypted_name.chars
    tally = chars.tally
    most_common_letters = chars.uniq.max_by(5) { |char| [tally[char], -char.ord] }.join
    checksum == most_common_letters
  end

  def sector_id
    sector_id_string.to_i
  end
end

lines = File.readlines("input.txt")
sector_id_sum = lines
  .map { |line| Room.new(line) }
  .select(&:real?)
  .sum(&:sector_id)
p sector_id_sum
