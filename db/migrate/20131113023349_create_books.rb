class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string  :name
      t.integer :quantity
      t.integer :year
      t.string  :lenguage
      t.string  :section
      t.float   :penalty

      t.integer :author_id

      t.timestamps
    end

      add_index :books, [:name, :author_id]
      add_index :books, :section
  end
end
