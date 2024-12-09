require "active_support/all"

class Passport
  attr_reader :byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid

  def initialize(data)
    @byr = data.scan(/byr:(\w+)/).join
    @iyr = data.scan(/iyr:(\w+)/).join
    @eyr = data.scan(/eyr:(\w+)/).join
    @hgt = data.scan(/hgt:(\w+)/).join
    @hcl = data.scan(/hcl:(#\w+)/).join
    @ecl = data.scan(/ecl:(\w+)/).join
    @pid = data.scan(/pid:(\w+)/).join
  end

  def valid?
    Integer(byr).in?(1920..2002) &&
      Integer(iyr).in?(2010..2020) &&
      Integer(eyr).in?(2020..2030) &&
      (
        (hgt =~ /^[\d]{3}cm$/ && Integer(hgt.scan(/\d+/).join).in?(150..193)) ||
        (hgt =~ /^[\d]{2}in$/ && Integer(hgt.scan(/\d+/).join).in?(59..76))
      ) &&
      hcl =~ /^\#[\da-f]{6}$/ &&
      %w[amb blu brn gry grn hzl oth].include?(ecl) &&
      pid =~ /^[\d]{9}$/
  rescue StandardError
    false
  end
end

passports = File.read("input.txt").split("\n\n").map { |passport| passport.tr("\n", " ") }

p(
  passports.count do |passport|
    (passport.scan(/(\w{3}):/).flatten - ["cid"]).sort == %w[byr iyr eyr hgt hcl ecl pid].sort
  end
)

p(
  passports.count do |passport|
    Passport.new(passport).valid?
  end
)
