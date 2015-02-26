class User < ActiveRecord::Base
  has_secure_password
  has_many :company_reviews
  has_many :product_reviews
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true

end
