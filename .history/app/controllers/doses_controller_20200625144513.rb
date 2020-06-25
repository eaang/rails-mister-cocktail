class DosesController < ApplicationController
  def destroy
    cocktail = @cocktail
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to cocktail
  end
end
