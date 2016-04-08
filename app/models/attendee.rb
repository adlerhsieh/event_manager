class Attendee < ActiveRecord::Base
  belongs_to :event, foreign_key: "event_id", primary_key: "id" 
end
