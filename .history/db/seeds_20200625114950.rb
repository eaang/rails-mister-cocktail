require "json"
require "open-uri"
data = open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read
content = JSON.parse(data)