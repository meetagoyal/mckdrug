class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.decimal :cost, null: false
      t.belongs_to :user, index: true, null: false
      t.belongs_to :product, index: true, null: false
      t.timestamps
    end

    add_foreign_key :orders, :users
    add_foreign_key :orders, :products
  end
end