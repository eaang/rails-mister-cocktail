require 'open-uri'
response = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
URI.parse(response).class
puts "\n\n#{response.inspect}\n\n"