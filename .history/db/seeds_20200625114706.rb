require 'open-uri'
response = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read

# "Pretty prints" the result to look like a web page instead of one long string of HTML
URI.parse(response).class

# Print the contents of the website to the console
puts "\n\n#{response.inspect}\n\n"