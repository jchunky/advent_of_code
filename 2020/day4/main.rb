require "active_support/all"

passports = File.read("input.txt").split("\n\n").map { |passport| passport.tr("\n", " ") }

p(
  passports.count do |passport|
    (passport.scan(/(\w{3}):/).flatten - ["cid"]).sort == %w[byr iyr eyr hgt hcl ecl pid].sort
  end
)
