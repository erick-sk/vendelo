class FavoritesController < ApplicationController
  def index
  end
  def create
    set_product.favorite!
    respond_to do |format|
      format.html do
        redirect_to product_path(set_product)
      end
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("favorite", partial: "products/favorite", locals: {product: set_product})
      end
    end
  end

  def destroy
    set_product.unfavorite!
    respond_to do |format|
      format.html do
        redirect_to product_path(set_product), status: :see_other
      end
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("favorite", partial: "products/favorite", locals: {product: set_product})
      end
    end
  end

  private

  def set_product
    @set_product ||= Product.find(params[:product_id])
  end
end