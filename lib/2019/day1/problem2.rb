module Year2019
  module Day1
    class Problem2 < Problem
      def self.test_result
        5097039
      end

      def result
        lines.map(&:to_i).sum { |mass| required_fuel_for(mass) }
      end

      def required_fuel_for(mass)
        fuel_mass = (mass / 3) - 2
        return 0 if fuel_mass <= 0

        fuel_mass + required_fuel_for(fuel_mass)
      end
    end
  end
end
