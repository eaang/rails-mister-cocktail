require 'json'
require 'open-uri'

data = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)['drinks']

data.each { |entry| puts entry[strIngredient1'] }
