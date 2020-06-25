class CocktailsController < ApplicationController
  def index
    if params[:query].present?
      search = "name LIKE '%#{params[:query].split(' ').join('%')}%'"
      @cocktails = Flat.where(search)
    else
      @cocktails = Cocktail.all.order('name ASC')
    end
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.where(cocktail: @cocktail)
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save

    redirect_to @cocktail
  end

  private

  def cocktail_params
    params.permit(:name, :query)
  end
end
