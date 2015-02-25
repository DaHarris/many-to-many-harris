class Company < ActiveRecord::Base
  has_many :company_reviews
  has_many :products


end
