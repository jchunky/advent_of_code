require "active_support/all"
require "digest"

input = "bgvyzdsv" # 254575

(1..).lazy.each do |i|
  hash = Digest::MD5.hexdigest("#{input}#{i}")
  abort(i.to_s) if hash.start_with?("000000")
end
