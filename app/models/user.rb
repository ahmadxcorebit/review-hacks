class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :products, dependent: :destroy
  has_many :reviews, through: :products, dependent: :destroy
  has_one_attached :image
  after_commit :add_default_image, on: %i[create update]

  def image_thumbnail
    if image.attached?
      image.variant(resize: '150x150!').processed
    else
      '/profile.png'
    end
  end

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
