class Event < ActiveRecord::Base
  scope :view, Proc.new{|view_count| where("view > ?", view_count) }
  scope :sum_view, -> { sum(:view) }
  scope :search, lambda {|term| where("name LIKE ?", "%#{term}%") }

  has_many :attendees, dependent: :destroy
  has_one :location
  has_many :groups, through: :event_groups
  has_many :event_groups
  belongs_to :category
  accepts_nested_attributes_for :location, :allow_destroy => true, :reject_if => :all_blank

  has_many :users, through: :memberships
  has_many :memberships

  # validates :name, presence: true
end
