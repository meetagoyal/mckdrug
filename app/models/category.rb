# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  has_many :subcategories, dependent: :delete_all

  validates :name, presence: true
  validates :name, uniqueness: true
end
