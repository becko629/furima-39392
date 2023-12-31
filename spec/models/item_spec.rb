require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規商品の出品' do
    context '新規出品ができるとき' do
      it '全項目があれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '新規出品ができない時' do
      it 'imageが一枚ないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include include("Image can't be blank")
      end
      it 'titleがないと出品できない' do
        @item.title = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include include("Title can't be blank")
      end
      it 'descriptionがないと出品できない' do
        @item.description = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include include("Description can't be blank")
      end
      it 'category_idがないと出品できない' do
        @item.category_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include include("Category can't be blank")
      end
      it 'condition_idがないと出品できない' do
        @item.condition_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include include("Condition can't be blank")
      end
      it 'shipping_charge_idの情報がないと出品できない' do
        @item.shipping_charge_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include include("Shipping charge can't be blank")
      end
      it 'prefecture_idの情報がないと出品できない' do
        @item.prefecture_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include include("Prefecture can't be blank")
      end
      it 'shipping_day_idの情報がないと出品できない' do
        @item.shipping_day_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include include("Shipping day can't be blank")
      end
      it 'priceがないと出品できない' do
        @item.price = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include include('Price is not a number')
      end
      it 'priceは半角数値以外は保存できない' do
        @item.price = 'あああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include include('Price is not a number')
      end
      it 'priceは300円未満では保存できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include include('Price must be greater than or equal to 300')
      end
      it 'priceは9_999_999円を超えると出品できない' do
        @item.price = '10_000_000'
        @item.valid?
        expect(@item.errors.full_messages).to include include('Price must be an integer')
      end
      it 'category_idで1が選択されていると登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include include("Category can't be blank")
      end
      it 'condition_idで1が選択されていると登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include include("Condition can't be blank")
      end
      it 'prefecture_idで1が選択されていると登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include include("Prefecture can't be blank")
      end
      it 'shipping_day_idで1が選択されていると登録できない' do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include include("Shipping day can't be blank")
      end
      it 'shipping_charge_idで1が選択されていると登録できない' do
        @item.shipping_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include include("Shipping charge can't be blank")
      end
    end
  end
end
