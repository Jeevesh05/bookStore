class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:add_to_cart]
  before_action :authenticate_seller!, only: [:new, :create, :edit, :update, :destroy, :my_products]

  def index
    @products = Product.all

  end

  def search
    @products = Product.where("name LIKE ?","%" + params[:q] + "%")
  end

  def show
    @products = Product.find(params[:id])
    @related_products = Product.all
  end

  def my_products
    @products = current_seller.products
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_seller.products.build(product_params)

    if @product.save
      if params[:product][:category].present?
        @product.categories << Category.find_or_create_by(name: params[:product][:category])
      end
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

    # app/controllers/products_controller.rb

  def add_to_cart
      @product = Product.find(params[:id])
      quantity = params[:quantity].to_i

      if quantity <= 0
        flash[:error] = "Invalid quantity."
      elsif @product.quantity < quantity
        flash[:error] = "Not enough available quantity for this product."
      else
        if current_user.active_cart.nil?
          current_user.create_active_cart
        end

        # Decrement quantity from seller's inventory
        @product.update(quantity: @product.quantity - quantity)

        # Add product to user's cart
        current_user.active_cart.add_item(@product, quantity)

        flash[:success] = "Product added to cart successfully."
      end

      redirect_to product_path
  end
<<<<<<< HEAD
=======

>>>>>>> origin/master

  private
    def product_params
      params.require(:product).permit(:name, :price, :author, :description,
       :summary, :quantity, :image, :category, category_ids: [])
    end
end
