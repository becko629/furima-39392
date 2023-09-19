class PurchaseRecordsController < ApplicationController
  def index
    @purchase_record_address = PurchaserecordsAddress.order
  end

  def create
    @purchase_record_address = PurchaserecordsAddress.new(purchase_record_params)
  end

  private

  def purchase_record_params
  params.require(:purchase_record_address).permit(:post_code, :prefecture, :city , :street_address, :building_name, :phone_number, :item_id, :user_id).merge(user_id: current_user.id)
end
