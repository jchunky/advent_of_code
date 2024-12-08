require "active_support/all"
require "digest"

input = "reyedfim"

# index = 0
# password = ""
# while password.length < 8
#   hash = Digest::MD5.hexdigest("#{input}#{index}")
#   password += hash[5] if hash.start_with?("00000")
#   index += 1
# end
# p password # f97c354d

index = 0
password = "_" * 8
puts password
while password.include?("_")
  hash = Digest::MD5.hexdigest("#{input}#{index}")
  position = (Integer(hash[5]) rescue nil)
  if hash.start_with?("00000") && (0..7).cover?(position) && password[position] == "_"
    password[position] = hash[6]
    system("clear")
    puts password
  end
  index += 1
end
p password # 863dde27
