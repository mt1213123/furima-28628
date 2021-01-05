class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :days
  belongs_to :fee

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :description
    validates :price, numericality: { greater_than: 300, less_than: 9_999_999 }
  end

  with_options numericality: {other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :prefecture_id
    validates :days_id
  end
end
