class Event < ActiveRecord::Base
  has_many :attendees, -> { where("name LIKE ?", "%as%") } , dependent: :destroy
  has_one :location
  has_many :groups, through: :event_groups
  has_many :event_groups
  belongs_to :category
  accepts_nested_attributes_for :location, :allow_destroy => true, :reject_if => :all_blank
end
