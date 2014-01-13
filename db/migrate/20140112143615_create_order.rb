class CreateOrder < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :book_id
      t.integer :user_id

      t.boolean :picked, default: false, null: false
      t.date    :picked_up_at

      t.timestamps
    end
  end
end
