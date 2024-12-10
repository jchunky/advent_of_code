module Year2020
  module Day4
    class Problem2 < Problem
      def self.test_result
        140
      end

      def result
        passports = input.split("\n\n").map { |passport| passport.tr("\n", " ") }

        passports.count do |passport|
          Passport.new(passport).valid?
        end
      end
    end
  end
end
