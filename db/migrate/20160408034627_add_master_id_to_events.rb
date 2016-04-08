class AddMasterIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :master_id, :integer
  end
end
