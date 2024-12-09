require "active_support/all"

lines = File.read("input.txt").split("\n")

def required_fuel_for(mass)
  fuel_mass = (mass / 3) - 2
  return 0 if fuel_mass <= 0

  fuel_mass + required_fuel_for(fuel_mass)
end

p(lines.map(&:to_i).sum { |mass| (mass / 3) - 2 })

p(lines.map(&:to_i).sum { |mass| required_fuel_for(mass) })
