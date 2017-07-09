class ReviewsController < ApplicationController

  before_action :authorize, only: [:create, :destroy]

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    @review.product_id = params[:product_id]

    if @review.save
      redirect_to "/products/" + params[:product_id]
    else
      redirect_to "/"
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])

    if current_user.id == @review.user_id
      @review.delete
    redirect_to "/products/#{params[:product_id]}"
    end
  end

  private

  def review_params
    params.require(:review).permit(
    :description,
    :rating
    )
  end

end
