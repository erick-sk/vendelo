class ProductsController < ApplicationController
  def index
    @products = Product.all.with_attached_photo
  end

  def show
    set_product
  end

  def new
    @product = Product.new
  end

  def edit
    set_product
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "The product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if set_product.update(product_params)
      redirect_to products_path, notice: "The product was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    set_product.destroy

    redirect_to products_path, alert: "The product was successfully deleted.", status: :see_other
  end

  private

    def product_params
      params.require(:product).permit(:title, :description, :price, :photo)
    end

    def set_product
      @product = Product.find(params[:id])
    end
end