class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.integer :price
      t.string :receiver_type
      t.integer :receiver_id

      t.timestamps null: false
    end
  end
end
