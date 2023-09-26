require 'rails_helper'

RSpec.describe Address, type: :model do
  
    before do
      @address = FactoryBot.build(:address)
    end
    
    describe '配送先の登録' do
    context '内容に問題ない場合' do
      it '建物名以外の全項目があれば出品できる' do
        expect(@address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'post_codeがないと出品できない'
       @address.post_code = nil
       @address.valid?
       expect(@address.errors.full_messages).to include include("Post_code can't be blank")
      end

      it 'post_codeは3桁ハイフン4桁の半角文字列以外は登録できない' do
        @address.post_code = '111'
        @address.valid?
        expect(@address.errors.full_messages).to include include("Post_code can't be blank")
      end

      it 'prefecture_idが空だと登録できない' do
        @address.prefecture_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include include("Prefecture_id can't be blank")
      end

      it 'cityが空だと登録できない' do
        @address.post_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include include("city can't be blank")
      end

      it 'street_addressが空だと登録できない' do
        @address.street_address = nil
        @address.valid?
        expect(@address.errors.full_messages).to include include("Street_address can't be blank")
      end

      it 'phone_numberが空だと登録できない' do
        @address.phone_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include include("Phone_number can't be blank")
      end

      it 'phone_numberが10桁以上11桁以内の半角数値以外だと登録できない' do
        @address.phone_number = '111111'
        @address.valid?
        expect(@address.errors.full_messages).to include include("Phone_number can't be blank")
      end

      it 'phone_numberに-が入ると登録できない' do
        @address.phone_number = '111-1111-1111'
        @address.valid?
        expect(@address.errors.full_messages).to include include("Phone_number can't be blank")
      end
    end
  end
