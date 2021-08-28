class Review < ApplicationRecord

  validates :user_id, :product_id, :user_review, presence: true

  belongs_to :product
  belongs_to :user

  scope :ordered, -> { order('created_at desc' ) }

end
