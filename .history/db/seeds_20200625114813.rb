require "json"
require "open-uri"
data = open("http://localhost:3000/foobar/get").read
puts JSON.parse(data)