class User < ApplicationRecord
  enum role: [:normal_user, :author, :admin]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :publications 
  has_many :comentarios
  has_one_attached :image

  validates :image, presence: true, unless: :admin?
end
