class FavoritesController < ApplicationController
  def index
  end
  def create
    set_product.favorite!
    redirect_to product_path(set_product)
  end

  def destroy
    set_product.unfavorite!
    redirect_to product_path(set_product), status: :see_other
  end

  private

  def set_product
    @set_product ||= Product.find(params[:product_id])
  end
end