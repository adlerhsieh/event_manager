class ChangeFooToBar < ActiveRecord::Migration
  def up
    change_column :events, :foo, :string
  end

  def down
    change_column :events, :foo, :integer, default: 0
  end
end
