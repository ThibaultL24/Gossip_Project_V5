class Message < ApplicationRecord
  belongs_to :user, optional: true
  has_many :recipients
  has_many :users, through: :recipients
  
  validates :content, presence: true
end