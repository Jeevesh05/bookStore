class CartsController < ApplicationController
    before_action :authenticate_user!

    # GET /carts
    def index
      @carts = Cart.all
    end
  
    # GET /carts/1
    def show
        @cart = current_user.active_cart
    end
  
    # GET /carts/new
    def new
      @cart = Cart.new
    end
  
    # POST /carts
    def create
      @cart = Cart.new(cart_params)
  
      if @cart.save
        redirect_to @cart, notice: 'Cart was successfully created.'
      else
        render :new
      end
    end
  
    # GET /carts/1/edit
    def edit
    end
  
    # PATCH/PUT /carts/1
    def update
      if @cart.update(cart_params)
        redirect_to @cart, notice: 'Cart was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /carts/1
    def destroy
      @cart.destroy
      redirect_to carts_url, notice: 'Cart was successfully destroyed.'
    end

    def destroy_item
        @cart = current_user.active_cart
        @cart_item = @cart.cart_items.find(params[:cart_item_id])
        @cart_item.destroy
        redirect_to cart_path, notice: 'Item removed from cart.'
    end

    def clear
      @cart = current_user.active_cart
      if @cart
        @cart.cart_items.destroy_all
        redirect_to cart_path, notice: "Cart cleared successfully!"
      else
        redirect_to root_path, alert: "No active cart found."
      end
    end

    def update_quantity
      @cart_item = CartItem.find(params[:cart_item_id])
      quantity = params[:cart_item][:quantity].to_i
    
      if quantity <= 0
        flash[:error] = 'Invalid quantity.'
      elsif @cart_item.product.quantity < quantity
        flash[:error] = 'Not enough available quantity for this product.'
      else
        if @cart_item.update(quantity: quantity)
          redirect_to cart_path, notice: 'Quantity updated successfully.'
        else
          flash[:error] = 'Failed to update quantity.'
          redirect_to cart_path
        end
        return
      end
    
      redirect_to cart_path
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_cart
        @cart = Cart.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def cart_params
        params.require(:cart).permit(:name, :description, :user_id)
      end
end