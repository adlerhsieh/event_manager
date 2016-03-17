class User < ActiveRecord::Base
  has_many :events, through: :memberships
  has_many :memberships
end
