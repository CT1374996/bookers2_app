class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  has_one_attached :profile_image

  def get profile_file_image
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/no_image.jpg')
    profile_image_attach(io: File.open(file_path))
  end
    profile_image.variant(resize_to_limit:[100, 100]).processed
  end
end
