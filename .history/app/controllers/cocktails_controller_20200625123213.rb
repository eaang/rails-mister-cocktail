class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save

    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :doses)
  end
end