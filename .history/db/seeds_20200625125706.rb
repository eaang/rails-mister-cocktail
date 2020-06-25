require 'json'
require 'open-uri'

ingredients = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)['drinks']

ingredients.each { |ingredient| Ingredient.create(name: ingredient['strIngredient1']) }

5.times do
  data = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/random.php').read)['drinks'][0]
  cocktail = Cocktail.create(name: data['strDrink'])
  ingredient = data.select { |key, _| key.to_s.match(/strIngredient/) }.values
  ingredients.map { |ingredient| Ingredient.where("name like ?", "#{ingredient}") }
  amounts = data.select { |key, _| key.to_s.match(/strMeasure/) }.values
  doses = amounts.zip(ingredients).filter { |dose| !dose[1].nil? }
end
