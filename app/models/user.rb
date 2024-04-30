class User < ApplicationRecord
  has_many :gossips, dependent: :destroy
  has_many :tags
  has_many :recipients
  has_many :messages, through: :recipients
  belongs_to :city, optional: true
  
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :description, presence: true
end