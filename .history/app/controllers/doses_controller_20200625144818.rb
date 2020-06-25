class DosesController < ApplicationController
  def destroy
    @dose = Dose.find(params[:id])
    debugger
    @dose.destroy

    redirect_to cocktail
  end
end
