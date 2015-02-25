class Product < ActiveRecord::Base
  belongs_to :company
  has_many :product_reviews
end
