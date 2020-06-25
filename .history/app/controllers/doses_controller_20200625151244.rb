class DosesController < ApplicationController
  def destroy
    @dose = Dose.find(params[:id])
    cocktail = @dose.cocktail
    @dose.destroy

    redirect_to cocktail
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id].to_i)
    @dose.ingredient = Ingredient.find(params[:ingredient_id].to_i)
    @dose.save if @dose.valid?
    redirect_to fail
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail, :ingredient)
  end
end
