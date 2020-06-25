require 'json'
require 'open-uri'

ingredients = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)['drinks']

ingredients.each { |ingredient| Ingredient.create(name: ingredient['strIngredient1']) }

cocktail = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/random.php').read))

10.times do |