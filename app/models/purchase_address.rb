class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :prefecture_id, :city, :block_num, :building, :phone_num, :purchase
end

VALID_POSTALCODE_REGEX = /^\d{3}[-]\d{2}$/
VALID_PHONE_REGEX = /^\d{11}$/

with_options presence: true do
  validates :user
  validates :item
  validates :postal_code, format: { with: VALID_POSTALCODE_REGEX }
  validates :prefecture_id, numericality: {other_than: 1 }
  validates :city
  validates :block_num
  validates :phone_num, format: { with: VALID_PHONE_REGEX }
  validates :purchase
end

def save
   purchase = Purchase.create(user: user, item: item)
   Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block_num: block_num, building: building, phone_num: phone_num)   
 end
end
