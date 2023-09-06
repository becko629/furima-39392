require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it '全項目があれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordは、半角英数字混合で6文字以上であれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない時' do
      it 'nicknameが空では登録できない。' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include include("Nickname can't be blank")
      end
      it 'emailが空では登録できない。' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include include("Email can't be blank")
      end
      it 'emailが一意性であること。' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは、@を含まないと登録できない。' do
        @user.email = '@'
        @user.valid?
        expect(@user.errors.full_messages).to include include('Email is invalid')
      end
      it 'passwordが空では登録できない。' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationは、値の一致していないと登録できない。' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid')
      end
      it 'last_nameが半角では登録できない' do
        @user.last_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana is invalid')
      end
      it 'first_name_kanaが半角では登録できない' do
        @user.first_name_kana = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'last_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana is invalid')
      end
      it 'last_name_kanaが半角では登録できない' do
        @user.first_name_kana = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'birthdayが空では登録できない。' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include include("Birthday can't be blank")
      end
      it 'passwordは6文字未満だと登録できない' do
        @user.password = 'aa111'
        @user.password_confirmation = 'aa111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは全角では登録できない' do
        @user.password = 'あああああああ'
        @user.password_confirmation = 'あああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが数字だけだと登録できない' do
        @user.password = '11111111'
        @user.password_confirmation = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが英字だけだと登録できない' do
        @user.password = 'aaaaaaaa'
        @user.password_confirmation = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
    end
  end
end
