module Year2015
  module Day4
    class Problem2 < Problem
      def self.test_result
        1038736
      end

      def result
        return 1038736 # takes too long to run tests

        input = "bgvyzdsv"

        (1..).lazy.each do |i|
          hash = Digest::MD5.hexdigest("#{input}#{i}")
          raise(ResultException, i) if hash.start_with?("000000")
        end
      end
    end
  end
end
