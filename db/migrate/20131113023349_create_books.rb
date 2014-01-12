class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string  :name
      t.integer :quantity
      t.integer :year
      t.string  :lenguage

      t.integer :author_id

      t.timestamps
    end

      add_index :books, [:name, :author_id]
  end
end
