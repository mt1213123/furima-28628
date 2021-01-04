FactoryBot.define do
  factory :item do
    title                 { 'ねこ' }
    description           { 'ねこ' }
    category_id           { 14 }
    condition_id          { 2 }
    fee_id                { 2 }
    prefecture_id         { 13 }
    days_id               { 3 }
    price                 { 4000 }
    user
  end
end
