class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.order(name: :asc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'New category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:product).permit(:name)
  end

end
