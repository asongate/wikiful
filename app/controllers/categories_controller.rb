class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:name)
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.order(updated_at: :desc)
  end
end
