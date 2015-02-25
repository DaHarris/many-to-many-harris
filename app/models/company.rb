class Company < ActiveRecord::Base
  has_many :company_reviews
  has_many :products
  validates :name, :catch_phrase, :suffix, presence: true


end
