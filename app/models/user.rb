class User < ApplicationRecord
  has_many :gossips, dependent: :destroy
  has_many :tags
  has_many :recipients
  has_many :likes
  has_many :messages, through: :recipients
  belongs_to :city, optional: true

  has_secure_password
  
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :description, presence: true
  validates :age, presence: true
  validates :city_id, presence: true
end