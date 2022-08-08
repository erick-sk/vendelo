class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
    set_category
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_url, notice: t('.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if set_category.update(category_params)
      redirect_to categories_url, notice: t('.updated')
      else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    set_category.destroy

    redirect_to categories_url, alert: t('.destroyed')
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:Name)
    end
end
