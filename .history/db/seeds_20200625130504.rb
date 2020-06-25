require 'json'
require 'open-uri'

ingredients = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)['drinks']

ingredients.each { |ingredient| Ingredient.create(name: ingredient['strIngredient1']) }

5.times do
  data = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/random.php').read)['drinks'][0]
  cocktail = Cocktail.create(name: data['strDrink'])
  ingredients = data.select { |key, _| key.to_s.match(/strIngredient/) }.values.compact
  ingredients.map! { |ingredient| Ingredient.find_by name: Ingredient }
  amounts = data.select { |key, _| key.to_s.match(/strMeasure/) }.values.compact
  doses = amounts.zip(ingredients).filter { |dose| !dose[1].nil? }
  doses.each { |dose| Dose.create(cocktail: cocktail, ingredient: dose[1], description: dose[0]) }
end
