class PurchaseRecordsAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city , :street_address, :building_name, :phone_number, :item_id, :user_id, :token

with_options presence: true do
  validates :post_code, format: { with: /\A\d{3}[-]?\d{4}\z/ }
  validates :prefecture_id
  validates :city
  validates :street_address
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  validates :token
end
  validate :building_name

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id )
  end
end