class DosesController < ApplicationController
  def destroy
    @dose = Dose.find(params[:id])
    debug(params)
    @dose.destroy

    redirect_to cocktail
  end
end
