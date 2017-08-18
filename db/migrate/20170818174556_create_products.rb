class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :photo
      t.integer :quantity
      t.decimal :price
      t.integer :packsize
      t.belongs_to :subcategory, index: true, null: false
      t.timestamps
    end

    add_foreign_key :products, :subcategories
    add_index :products, [:name, :packsize, :subcategory_id], unique: true
  end
end