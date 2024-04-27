class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_initial_cart
  validates :name, presence: false
  validates :address, presence: false
  validates :phone_number, presence: false
  has_one :active_cart, -> { active }, class_name: 'Cart'
  has_many :saved_carts, -> { where.not(status: 'active') }, class_name: 'Cart'
  has_many :orders

  private

  def create_initial_cart
    Rails.logger.debug "Creating initial cart for user: #{self.email}"
    cart = Cart.create(user: self)
    if cart.persisted?
      Rails.logger.debug "Initial cart created successfully for user: #{self.email}"
    else
      Rails.logger.error "Failed to create initial cart for user: #{self.email}"
    end
  end
end
