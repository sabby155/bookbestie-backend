class Status < ApplicationRecord
  belongs_to :card
  belongs_to :user 
end
