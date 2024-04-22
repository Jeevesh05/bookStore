class OrdersController < ApplicationController

  def index
    @orders = Order.order(created_at: :asc).all
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.build
    @order.cart_items << current_user.cart.cart_items
    @order.order_date = Time.now

    if @order.save
      # Clear the user's cart after placing the order
      current_user.cart.cart_items.destroy_all
      redirect_to order_path(@order), notice: "Order placed successfully!"
    else
      render :new
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
    # @order.update_status  # Call method to update order status
  end


  def review
      @cart = current_user.active_cart
      @user = current_user
      @order_review_date = Date.today
      @estimate_delivery_date = Date.today + 3
      @tax = ((@cart.total_amount) *18)/100
      @discount= ((@cart.total_amount)*5)/100
      @total_bill= @cart.total_amount + @tax - @discount
    end

   def checkout
    user = current_user
    active_cart = user.active_cart
    
    if active_cart
      order = Order.create(user: user)
      active_cart.cart_items.each do |cart_item|
        order.order_items.create(
          product: cart_item.product,
          quantity: cart_item.quantity,
          price: cart_item.product.price
        )
      end
      active_cart.clear
      redirect_to order_path(order), notice: "Order placed successfully!"
    else
      redirect_to root_path, alert: "No active cart found."
    end
  end

end
