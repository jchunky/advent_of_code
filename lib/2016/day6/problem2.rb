module Year2016
  module Day6
    class Problem2 < Problem
      def self.test_input
        "eedadn
drvtee
eandsr
raavrd
atevrs
tsrnev
sdttsa
rasrtv
nssdts
ntnada
svetve
tesnvt
vntsnd
vrdear
dvrsen
enarar"
      end

      def self.test_result
        "advent"
      end

      def result
        lines.map(&:chars).transpose.map do |column|
          column.min_by { |c| column.count(c) }
        end.join
      end
    end
  end
end
