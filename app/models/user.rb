class User < ApplicationRecord
  validates_presence_of :username
  validates_uniqueness_of :email
  validates_presence_of :password
end
