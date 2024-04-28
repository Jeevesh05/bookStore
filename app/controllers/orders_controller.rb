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
     @ordered_item_price = @order.order_items.sum { |item| item.price * item.quantity }
     @tax = ((@ordered_item_price) *18)/100
     @discount= ((@ordered_item_price)*10)/100
     @total_bill= @ordered_item_price + @tax - @discount
     @order_review_date = @order.created_at
     @estimate_delivery_date = @order_review_date + 3.days

     @order.update_status
  end


  def review
      @cart = current_user.active_cart
      @user = current_user
      @order_review_date = Date.today
      @estimate_delivery_date = Date.today + 3
      @tax = ((@cart.total_amount) *18)/100
      @discount= ((@cart.total_amount)*10)/100
      @total_bill= @cart.total_amount + @tax - @discount
    end

  def calculate_ordered_item_price
    # Fetch all order items from your database
    order_items = OrderItem.all

    # Initialize the variable to store the sum
    ordered_item_price = 0

    # Iterate over each order item and accumulate the prices
    order_items.each do |order_item|
      ordered_item_price += order_item.price
    end
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
