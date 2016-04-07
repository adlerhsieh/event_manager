class AddCountToEvents < ActiveRecord::Migration
  def change
    add_column :events, :view, :integer
    add_column :events, :public, :boolean
  end
end
