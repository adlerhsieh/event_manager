class Agency < ActiveRecord::Base
  has_many :receipts, :as => :receiver
end
