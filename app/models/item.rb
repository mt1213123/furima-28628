class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category_id
    belongs_to :condition_id
    belongs_to :prefecture_id
    belongs_to :days_id
    belongs_to :fee_id
  

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do 
    validates :image
    validates :title
    validates :description
    validates :price
  end

  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :fee_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :days_id, numericality: { other_than: 1 }   
end
