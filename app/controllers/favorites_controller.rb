class FavoritesController < ApplicationController
  def create
    Favorite.create(product: set_product, user: Current.user)
    redirect_to product_path(set_product)
  end

  def destroy
    set_product.favorites.find_by(user: Current.user).destroy
    redirect_to product_path(set_product), status: :see_other
  end

  private

  def set_product
    @set_product ||= Product.find(params[:product_id])
  end
end