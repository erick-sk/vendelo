class FavoritesController < ApplicationController
  def create
    Favorite.create(product: set_product, user: Current.user)
    redirect_to product_path(set_product)
  end

  private

  def set_product
    @set_product ||= Product.find(params[:product_id])
  end
end