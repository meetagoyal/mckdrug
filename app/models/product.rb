
class Product < ApplicationRecord
    
  belongs_to :subcategory
  
  validates :name, :price, :quantity ,  presence: true
  validates :name, uniqueness: { scope: [:name, :packsize ,:subcategory_id] }
end
