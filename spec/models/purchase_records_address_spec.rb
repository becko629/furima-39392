require 'rails_helper'

RSpec.describe PurchaseRecordsAddress, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      @purchase_record_address = FactoryBot.build(:purchase_records_address, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it '全ての必要な項目があれば出品できる' do
        expect(@purchase_record_address).to be_valid
      end

      it 'building_nameが空でも登録できる' do
        @purchase_record_address.building_name = ''
        expect(@purchase_record_address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'post_codeがないと購入できない' do
        @purchase_record_address.post_code = ' '
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include include("Post code can't be blank")
      end

      it 'post_codeは3桁ハイフン4桁の半角文字列以外は購入できない' do
        @purchase_record_address.post_code = '111'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include include('Post code is invalid')
      end

      it 'prefecture_idが空だと購入できない' do
        @purchase_record_address.prefecture_id = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include include("Prefecture can't be blank")
      end

      it 'cityが空だと購入できない' do
        @purchase_record_address.city = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include include("City can't be blank")
      end

      it 'street_addressが空だと購入できない' do
        @purchase_record_address.street_address = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include include("Street address can't be blank")
      end

      it 'phone_numberが空だと購入できない' do
        @purchase_record_address.phone_number = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include include("Phone number can't be blank")
      end

      it 'phone_numberが10桁以上11桁以内の半角数値以外だと購入できない' do
        @purchase_record_address.phone_number = '111111'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include include('Phone number is invalid')
      end

      it 'phone_numberに-が入ると購入できない' do
        @purchase_record_address.phone_number = '111-1111-1111'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include include('Phone number is invalid')
      end

      it 'tokenが空では登録できない' do
        @purchase_record_address.token = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include include("Token can't be blank")
      end
    end
  end
end
