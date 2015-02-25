class CompanyReview < ActiveRecord::Base
  belongs_to :company
  validates :title, :description, :rating, :user_id, :company_id, presence: true


end
