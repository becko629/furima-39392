class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @purchase_record_address = PurchaseRecordsAddress.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.purchase_record != nil
      redirect_to root_path
    end
  end

  def create
    @purchase_record_address = PurchaseRecordsAddress.new(purchase_record_params)
    @item = Item.find(params[:item_id])
    if @purchase_record_address.valid?
      pay_item
      @purchase_record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
  params.require(:purchase_records_address).permit(:post_code, :prefecture_id, :city , :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_d71a44692249a1a3e4d4bac9"
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end
end
