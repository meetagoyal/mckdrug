# == Schema Information
#
# Table name: subcategories
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Subcategory < ApplicationRecord
    
  belongs_to :category
  validates :name ,  presence: true
  validates :name, uniqueness: { scope: [:name, :category_id] }
end
