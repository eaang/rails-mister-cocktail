class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    if @review.valid?
      @review.save

      redirect_to @cocktail
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :content, :rating)
  end
end
