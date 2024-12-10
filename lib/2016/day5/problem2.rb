module Year2016
  module Day5
    class Problem2 < Problem
      def result
        return 0 # todo

        input = "reyedfim"
        index = 0
        password = "_" * 8
        # puts password
        while password.include?("_")
          hash = Digest::MD5.hexdigest("#{input}#{index}")
          position = (Integer(hash[5]) rescue nil)
          if hash.start_with?("00000") && (0..7).cover?(position) && password[position] == "_"
            password[position] = hash[6]
            # system("clear")
            # puts password
          end
          index += 1
        end
        password # 863dde27
      end
    end
  end
end
