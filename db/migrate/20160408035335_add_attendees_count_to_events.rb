class AddAttendeesCountToEvents < ActiveRecord::Migration
  def change
    add_column :events, :attendees_count, :integer
  end
end
