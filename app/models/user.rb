class User < ActiveRecord::Base
  has_many :company_reviews
  has_many :product_reviews

end
