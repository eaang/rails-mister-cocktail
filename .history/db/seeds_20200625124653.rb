require 'json'
require 'open-uri'

ingredients = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)['drinks']

ingredients.each { |ingredient| Ingredient.create(name: ingredient['strIngredient1']) }

5.times do
  cocktail = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/random.php').read)['drinks'][0]
  Cocktail.new(name: cocktail['strDrink'])
  ingredients = cocktail.select { |key, _| key.to_s.match(/strIngredient/) }.values
  amounts = cocktail.select { |key, _| key.to_s.match(/strMeasure/) }.values
  doses = amounts.zip(ingredients).filter { |dose| !dose[1].nil? }
  doses.each do |dose|
    Dose.create 
  end
end
