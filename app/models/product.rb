class Product < ApplicationRecord

  validates :title, :description, :user_id, presence: true

  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many_attached :images

  after_commit :add_default_image, on: %i[create update]

  private

  def add_default_image
    unless images.attached?
      images.attach(
        io: File.open(Rails.root.join('app', 'assets', 'images', 'profile.png')),
        filename: 'profile.png',
        content_type: 'imaged/png'
      )
    end
  end

end
