class User < ActiveRecord::Base
  has_many :cornucopias
  has_many :items, through: :cornucopias

  has_secure_password
end
