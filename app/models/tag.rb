class Tag < ApplicationRecord
    has_many :gossip_tags
    has_many :gossips, through: :gossip_tags
    belongs_to :user
end
