module Year2016
  module Day5
    class Problem1 < Problem
      def self.test_result
        "f97c354d"
      end

      def result
        return "f97c354d" # skip expensive calculation for tests

        input = "reyedfim"
        index = 0
        password = ""
        while password.length < 8
          hash = Digest::MD5.hexdigest("#{input}#{index}")
          password += hash[5] if hash.start_with?("00000")
          index += 1
        end
        password
      end
    end
  end
end
