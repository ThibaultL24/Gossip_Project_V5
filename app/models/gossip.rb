class Gossip < ApplicationRecord
    belongs_to :user
    has_many :gossip_tags
    has_many :tags, through: :gossip_tags
    has_many :comments
    
    validates :user_id, presence: true
    validates :title, presence: true
    validates :description, presence: true
      
end
