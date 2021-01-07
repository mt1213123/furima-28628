class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :block_num, :building, :phone_num, :purchase_id, :token

VALID_POSTALCODE_REGEX = /\A\d{3}[-]\d{4}\z/
VALID_PHONE_REGEX = /\A\d{11}\z/

with_options presence: true do
  validates :user_id
  validates :item_id
  validates :postal_code, format: { with: VALID_POSTALCODE_REGEX }
  validates :prefecture_id, numericality: {other_than: 1 }
  validates :city
  validates :block_num
  validates :phone_num, length: { maximum: 11 }, format: { with: VALID_PHONE_REGEX }
  #validates :purchase_id
  validates :token
end

def save
   purchase = Purchase.create(user_id: user_id, item_id: item_id)
   Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block_num: block_num, building: building, phone_num: phone_num, purchase_id: purchase.id)   
end
end