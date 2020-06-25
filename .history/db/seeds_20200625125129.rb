require 'json'
require 'open-uri'

ingredients = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)['drinks']

ingredients.each { |ingredient| Ingredient.create(name: ingredient['strIngredient1']) }

5.times do
  data = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/random.php').read)['drinks'][0]
  cocktail = Cocktail.create(name: cocktail['strDrink'])
  ingredients = data.select { |key, _| key.to_s.match(/strIngredient/) }.values
  ingredients.map do |ingredient|
    Ingredient.where("title like ?", "%#{ingredient}%")
  end
  amounts = data.select { |key, _| key.to_s.match(/strMeasure/) }.values
  doses = amounts.zip(ingredients).filter { |dose| !dose[1].nil? }
end