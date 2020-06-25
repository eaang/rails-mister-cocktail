class DosesController < ApplicationController
  def destroy
    @dose = Dose.find(params[:id])
    cocktail = @dose.cocktail
    @dose.destroy

    redirect_to cocktail
  end

  def create
    @dose = Dose.new
    @dose.description = params[:dose][:description]
    @dose.cocktail = Cocktail.find(params[:dose][:cocktail])
    @dose.ingredient = Ingredient.find(params[:dose][:ingredient])
    @dose.save if @dose.valid?

    redirect_to @dose.cocktail
  end
end
