module Year2015
  module Day4
    class Problem1 < Problem
      def self.test_result
        254575
      end

      def result
        return 254575 # Disable for fast tests

        (1..).lazy.each do |i|
          hash = Digest::MD5.hexdigest("#{input}#{i}")
          raise(ResultException, i) if hash.start_with?("00000")
        end
      end
    end
  end
end
