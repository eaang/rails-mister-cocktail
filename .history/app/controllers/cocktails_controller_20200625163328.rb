class CocktailsController < ApplicationController
  def index
    if params[:query].present?
      @cocktails = []
      query = "name LIKE '%#{params[:query].split(' ').join('%')}%'"
      @cocktails << Cocktail.where(query)
    else
      @cocktails = Cocktail.all.order('name ASC')
    end
    @cocktail_new = Cocktail.new
  end

  def show
    @cocktail_new = Cocktail.new
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
