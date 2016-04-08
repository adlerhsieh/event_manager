class Receipt < ActiveRecord::Base
  belongs_to :receiver, :polymorphic => true
end
