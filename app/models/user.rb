class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: false
  validates :address, presence: false
  validates :phone_number, presence: false
  has_one :active_cart, -> { active }, class_name: 'Cart'
  has_many :saved_carts, -> { where.not(status: 'active') }, class_name: 'Cart'
end
