class CocktailsController < ApplicationController
  def index
    @cocktail = Cocktail.new
    @cocktails = Cocktail.all.order('name ASC')
  end

  def search
    @cocktail = Cocktail.find(cocktail_params[:cocktail][:id])
    redirect_to cocktail_path(@cocktail)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.where(cocktail: @cocktail)
    @dose = Dose.new
  end

  def update
    @show_cocktail = Cocktail.find(params[:id])
    @show_cocktail.update(cocktail_params[:cocktail])
    @show_cocktail.name = @show_cocktail.name.downcase

    redirect_to @show_cocktail
  end

  def create
    @cocktail = Cocktail.new(cocktail_params[:cocktail])
    @cocktail.name = @cocktail.name.downcase
    @cocktail.save if @cocktail.valid?

    redirect_to @cocktail
  end

  def destroy
    @show_cocktail = Cocktail.find(params[:id])
    @show_cocktail.destroy

    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.permit!
  end
end
