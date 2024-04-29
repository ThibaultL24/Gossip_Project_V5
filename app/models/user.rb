class User < ApplicationRecord
    has_many :gossips, dependent: :destroy
    has_many :tags
    has_many :recipients
    has_many :messages, through: :recipients
    belongs_to :city, optional: true
end
