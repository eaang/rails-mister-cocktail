class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all.order('name ASC')
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.where(cocktail: @cocktail)
  end

  def new
    @cocktail = Cocktail.new
    @doses = []
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save

    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
