class ProductReview < ActiveRecord::Base
  belongs_to :product
  validates :title, :description, :rating, :user_id, :product_id, presence: true


end
