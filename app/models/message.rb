class Message < ApplicationRecord
    belongs_to :user
    has_many :recipients
    has_many :users, through: :recipients
end
