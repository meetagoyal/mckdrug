# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  quantity   :integer
#  cost       :decimal(, )      not null
#  user_id    :integer          not null
#  product_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
  
  validates :quantity, :cost, :user_id, :product_id, presence: true
  belongs_to :user
  belongs_to :product
end
