require "active_support/all"
require "digest"

input = "reyedfim"

index = 0
password = ""
while password.length < 8
  hash = Digest::MD5.hexdigest("#{input}#{index}")
  password += hash[5] if hash.start_with?("00000")
  index += 1
end
p password # f97c354d
