class ProductsController < ApplicationController

  before_action :authenticate_seller!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_seller!, only: [:my_products]
  def index
    @products = Product.all

  end
  def search
    @products = Product.where("name LIKE ?","%" + params[:q] + "%")
  end

  def show
    @products = Product.find(params[:id])
  end

  def my_products
    #@products = Product.find(current_seller.products)
    #sellerID = current_seller.id
    #@products = Product.find(params[:sellerID])
    @products = current_seller.products
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_seller.products.build(product_params)

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :author, :category,
         :description, :quantity, :image)
    end
end
