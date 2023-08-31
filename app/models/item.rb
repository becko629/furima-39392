class Item < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_day_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :price, presence: true
  
end
