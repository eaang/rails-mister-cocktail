class DosesController < ApplicationController
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to  cocktail_url
  end
end
