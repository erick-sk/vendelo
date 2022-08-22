class ProductsController < ApplicationController
  skip_before_action :protect_pages, only: [:index, :show]

  def index
    @categories = Category.order(name: :asc).load_async

    @pagy, @products = pagy_countless(FindProducts.new.call(product_params_index).load_async, items: 12)
  end

  def show
    set_product
  end

  def new
    @product = Product.new
  end

  def edit
    authorize! set_product
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: t('.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize! set_product

    if set_product.update(product_params)
      redirect_to products_path, notice: t('.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! set_product

    set_product.destroy

    redirect_to products_path, alert: t('.destroyed'), status: :see_other
  end

  private

    def set_product
      @product ||= Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :category_id, :description, :price, :photo)
    end

    def product_params_index
      params.permit(:category_id, :min_price, :max_price, :query_text, :order_by, :page, :user_id, :favorites)
    end
end