class CreateSubcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :subcategories do |t|
      t.string :name, null: false
      t.belongs_to :category, index: true, null: false
      t.timestamps
    end

    add_foreign_key :subcategories, :categories
    add_index :subcategories, [:name, :category_id], unique: true
  end
end