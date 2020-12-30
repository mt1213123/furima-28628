class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々]/.freeze
  VALID_KANANAME_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
    validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
    validates :family_name, format: { with: VALID_NAME_REGEX }
    validates :first_name, format: { with: VALID_NAME_REGEX }
    validates :kanafamily_name, format: { with: VALID_KANANAME_REGEX }
    validates :kanafirst_name, format: { with: VALID_KANANAME_REGEX }
    validates :birth_day
  end
end
