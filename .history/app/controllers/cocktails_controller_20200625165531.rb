class CocktailsController < ApplicationController
  def index
    @cocktail = Cocktail.new
    if params[:query].present?
      search = "'%#{params[:query].downcase.strip.split(' ').join('%')}%'"
      @cocktails = Cocktail.where(search).joins(:ingredients).where(search)
    else
      @cocktails = Cocktail.all.order('name ASC')
    end
  end

  def show
    @cocktail = Cocktail.new
    @show_cocktail = Cocktail.find(params[:id])
    @doses = Dose.where(cocktail: @show_cocktail)
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save

    redirect_to @cocktail
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
