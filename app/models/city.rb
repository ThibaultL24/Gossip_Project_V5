class City < ApplicationRecord
    has_many :users

    validates :name, presence: true, uniqueness: true
  
    def gossips
      users.map(&:gossips).flatten
    end
end