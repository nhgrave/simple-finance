class CategoriesController < ApplicationController

  def index
    @categories = current_user.categories.order(:name)
  end

  def new
    @category = current_user.categories.new
  end

  def create
    @category = current_user.categories.new category_params

    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @category = current_user.categories.find params.require(:id)

    respond_to :html
  end

  def update
    @category = current_user.categories.find params.require(:id)

    if @category.update category_params
      redirect_to categories_path
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :active)
  end
end
