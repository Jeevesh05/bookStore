class ApplicationController < ActionController::Base
    before_action :set_cart_count

  private

  def set_cart_count
    @cart_count = current_user.active_cart.cart_items.count if current_user&.active_cart
  end
end
