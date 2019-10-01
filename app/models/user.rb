class User < ApplicationRecord
    has_secure_password 

    has_many :statuses
    has_many :cards, through: :statuses 
    # validates :username, presence: true, uniqueness: true, length: {minimum: 1}
end
