class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  after_commit :add_default_image, on: %i[create update]

  private

  def add_default_image
    unless image.attached?
      image.attach(
        io: File.open(Rails.root.join('app', 'assets', 'images', 'profile.png')),
        filename: 'profile.png',
        content_type: 'imaged/png'
      )
    end
  end
end
