class DosesController < ApplicationController
  def destroy
    @dose = Dose.find(params[:id])
    cocktail = @dose.cocktail
    @dose.destroy

    redirect_to cocktail
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.save

    redirect_to @dose.cocktail
  end

  private

  def dose_params
    params.require(:cocktail).permit(:name, :direction)
  end
end
