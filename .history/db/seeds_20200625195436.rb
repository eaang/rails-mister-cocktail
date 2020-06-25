require 'json'
require 'open-uri'

ingredients = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)['drinks']

ingredients.each { |ingredient| Ingredient.create(name: ingredient['strIngredient1'].downcase) }

def make_cocktail(data)
  name = data['strDrink'].downcase
  picture = data['strDrinkThumb']
  direction = data['strInstructions']
  [name, picture, direction]
end

10.times do
  data = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/random.php').read)['drinks'][0]
  info = make_cocktail(data)
  cocktail = Cocktail.create(name: info[0], picture: info[1], direction: info[2])
  ingredients = []
  ingredient_names = data.select { |key, _| key.to_s.match(/strIngredient/) }.values.compact
  ingredient_names.each do |name|
    result = Ingredient.find_by name: name.downcase
    result = Ingredient.create(name: name.downcase) if result.nil?
    ingredients << result
  end
  amounts = data.select { |key, _| key.to_s.match(/strMeasure/) }.values.compact
  doses = amounts.zip(ingredients)
  doses.each { |dose| Dose.create(cocktail: cocktail, ingredient: dose[1], description: dose[0].strip) }
end
