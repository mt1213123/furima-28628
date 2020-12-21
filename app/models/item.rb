class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do 
    validates :title
    validates :description
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :prefecture_id
    validates :days_id
    validates :price
  end
end
