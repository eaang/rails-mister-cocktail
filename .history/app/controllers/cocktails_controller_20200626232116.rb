class CocktailsController < ApplicationController
  def home
    @cocktails = Cocktail.all
    count = Cocktail.count
    random_offset = rand(count)
    @random_cocktail = Cocktail.offset(random_offset).first
  end

  def index
    @cocktail = Cocktail.new
    @cocktails = Cocktail.all.order('name ASC')
  end

  def search
    if params[:search].blank?

      redirect_to root_path
    else
      @input = params[:search]
      search = "name LIKE '%#{params[:search].downcase.split(' ').join('%')}%'"
      @cocktails = Cocktail.all.where(search)
      @ingredients = Cocktail.joins(:ingredients).where("ingredients.#{search}")
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @cocktails = Cocktail.all.order('name ASC')
    @doses = Dose.where(cocktail: @cocktail)
    @dose = Dose.new
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)

    redirect_to @cocktail
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save

    redirect_to @cocktail
  end

  def destroy
    @show_cocktail = Cocktail.find(params[:id])
    @show_cocktail.destroy

    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :direction, :photo)
  end
end
