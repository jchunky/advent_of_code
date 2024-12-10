module Year2015
  module Day4
    class Problem1 < Problem
      def result
        input = "bgvyzdsv" # 254575

        (1..).lazy.each do |i|
          hash = Digest::MD5.hexdigest("#{input}#{i}")
          raise(ResultException, i) if hash.start_with?("000000")
        end
      end
    end
  end
end
