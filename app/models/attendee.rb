class Attendee < ActiveRecord::Base
  belongs_to :event, :counter_cache => true
end
