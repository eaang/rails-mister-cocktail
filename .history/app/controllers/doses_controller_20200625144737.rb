class DosesController < ApplicationController
  def destroy
    @dose = Dose.find(params[:id])
    params.to_s
  end
end
