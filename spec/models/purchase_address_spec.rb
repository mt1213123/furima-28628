require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
    before do
      @purchase = FactoryBot.build(:purchase)
      @purchase_address = FactoryBot.build(:purchase_address)
    end
  
  describe '配送先情報の保存' do
   context '配送先情報の保存がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_addresses).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_address.building = nil
        expect(@purchase_address).to be_valid
      end
   end
    
   context '配送先情報の保存がうまくいかないとき' do
    it 'postal_codeが空だと保存できないこと' do
      @purchase_address.postal_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_address.postal_code = '1111111'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @purchase_address.prefecture_id = 1
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'cityが空だと保存できないこと' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it 'block_numが空だと保存できないこと' do
      @purchase_address.block_num = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Block num can't be blank")
    end
    it 'phone_numが空だと保存できないこと' do
      @purchase_address.phone_num = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone num can't be blank")
    end
    it 'phone_numにハイフンが含まれていると保存できないこと' do
      @purchase_address.phone_num = '080-0800-0800'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone num is invalid")
    end
    it 'phone_numが11桁以上だと保存できないこと' do
      @purchase_address.phone_num = '080080008000'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone num is invalid")
    end
    it 'phone_numが数字でないと保存できないこと' do
      @purchase_address.phone_num = 'aaaaaaaaaaa'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone num is invalid")
    end
    it 'phone_numが英数字混合であると保存できないこと' do
      @purchase_address.phone_num = 'aaaaaaaaaa1'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone num is invalid")
    end
    it "tokenが空では登録できないこと" do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが空だと保存できないこと' do
      @purchase.user_id = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("User must exist")
    end
    it 'item_idが空だと保存できないこと' do
      @purchase.item_id = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Item must exist")
    end
   end

  end
end