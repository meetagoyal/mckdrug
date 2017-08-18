# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  photo          :string
#  quantity       :integer
#  price          :decimal(, )
#  packsize       :integer
#  subcategory_id :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#


class Product < ApplicationRecord
    
  belongs_to :subcategory
  has_many :orders
  has_many :users, through: :orders
  validates :name, :price, :quantity ,  presence: true
  validates :name, uniqueness: { scope: [:name, :packsize ,:subcategory_id] }
end
