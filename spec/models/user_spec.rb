require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname、email、password、password_confirmation、family_name、first_name、kanafamily_name、kanafirst_nameとbirth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@がなければ登録できない' do
        @user.email = 'testexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaaaa'
        @user.password_confirmation = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'family_nameが英字では登録できない' do
        @user.family_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが英字では登録できない' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'kanafamily_nameが空では登録できない' do
        @user.kanafamily_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanafamily name can't be blank")
      end
      it 'kanafamily_nameがひらがなでは登録できない' do
        @user.kanafamily_name = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanafamily name is invalid")
      end
      it 'kanafamily_nameが漢字では登録できない' do
        @user.kanafamily_name = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanafamily name is invalid")
      end
      it 'kanafamily_nameが英字では登録できない' do
        @user.kanafamily_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanafamily name is invalid")
      end
      it 'kanafirst_nameが空では登録できない' do
        @user.kanafirst_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanafirst name can't be blank")
      end
      it 'kanafirst_nameがひらがなでは登録できない' do
        @user.kanafirst_name = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanafirst name is invalid")
      end
      it 'kanafirst_nameが漢字では登録できない' do
        @user.kanafirst_name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanafirst name is invalid")
      end
      it 'kanafirst_nameが英字では登録できない' do
        @user.kanafirst_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanafirst name is invalid")
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
