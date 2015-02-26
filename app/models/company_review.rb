class CompanyReview < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  validates :title, :description, :rating, :user_id, :company_id, presence: true


end
