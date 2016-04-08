class Event < ActiveRecord::Base
  scope :view, Proc.new{|view_count| where("view > ?", view_count) }
  scope :sum_view, -> { sum(:view) }
  scope :search, lambda {|term| where("name LIKE ?", "%#{term}%") }

  has_many :sub_events,     class_name: "Event", foreign_key: "master_id", primary_key: "id" 
  belongs_to :master_event, class_name: "Event", foreign_key: "master_id", primary_key: "id" 
  # Event.first.update(master_id: Event.last.id)
  # Event.first.master_event
  # Event.last.sub_events

  has_many :attendees, foreign_key: "event_id", primary_key: "id" 
  has_one :location
  has_many :groups, through: :event_groups
  has_many :event_groups
  belongs_to :category
  accepts_nested_attributes_for :location, :allow_destroy => true, :reject_if => :all_blank

  has_many :users, through: :memberships
  has_many :memberships

  # validates :name, presence: true
end
