class SellersController < ApplicationController
  before_action :authenticate_seller!

  def index
    @seller = current_seller
  end

  def edit
    @seller = current_seller
  end

  def update
    @seller = current_seller
    if @seller.update(seller_params)
      redirect_to seller_path, notice: "Profile updated successfully."
    else
      render :edit
    end
  end

  private

  def seller_params
    params.require(:seller).permit(:name, :address, :phone_number)
  end
end
