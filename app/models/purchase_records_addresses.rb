class PurchaserecordsAddresses
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :city , :street_address, :building_name, :phone_number, :item_id, :user_id
end

with_options presence: true do
  validates :post_code, format(with: \A\d{3}[-]?\d{4}\z)
  validates :prefecture
  validates :city
  validates :street_address
  validates :phone_number, format(with: \A0\d{10,11}\z)
end
  validates :building_name

  def save
    purchase_records = Purchaserecords.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture: prefecture, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, purchase_records_id: purchase_records.id )
  end
end