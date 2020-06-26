class DosesController < ApplicationController
  def destroy
    @dose = Dose.find(params[:id])
    cocktail = @dose.cocktail
    @dose.destroy

    redirect_to cocktail
  end

  def create
    @dose = Dose.new
    info = params[:dose]
    @dose.description = info[:description]
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.ingredient = Ingredient.find(info[:ingredient_id])
    @dose.save

    redirect_to @dose.cocktail
  end
end
