module Year2024
  module Day3
    class Problem2 < Problem
      def self.test_result
        90044227
      end

      def result
        elements = input
          .scan(/(mul\(\d+,\d+\)|do\(\)|don't\(\))/)
          .flatten

        enabled = true
        result = 0
        elements.each do |element|
          case element
          when /mul/
            result += element.scan(/(\d+),(\d+)/).flatten.map(&:to_i).reduce(:*) if enabled
          when /don't/
            enabled = false
          when /do/
            enabled = true
          end
        end

        result
      end
    end
  end
end
