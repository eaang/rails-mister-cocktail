class CocktailsController < ApplicationController
  def index
    @cocktail = Cocktail.new
    if params[:query].present?
      search = "'%#{params[:query].downcase.strip.split(' ').join('%')}%'"
      @cocktails = Cocktail.where("name LIKE #{search}")
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

  def update
    @show_cocktail.update(params[:cocktail])

    redirect_to @show_cocktail
  end

  def create
    @cocktail = Cocktail.new
    info = params[:cocktail]
    @cocktail.name = info[:name]
    @cocktail.direction = info[:direction].strip
    @cocktail.picture = info[:picture]
    @cocktail.save if @cocktail.valid?

    redirect_to @cocktail
  end

  private

  def cocktail_params
    params.permit(:name, :picture, :direction)
  end
end
