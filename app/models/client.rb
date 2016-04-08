class Client < ActiveRecord::Base
  has_many :receipts, :as => :receiver
end
