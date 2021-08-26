class Review < ApplicationRecord

  validates :user_id, :product_id, :user_review, presence: true

  belongs_to :product
  belongs_to :user

end
