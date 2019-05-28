class UserSerializer < ActiveModel::Serializer
  attributes :id, :username 
  has_many :statuses
  has_many :cards, through: :statuses

end
