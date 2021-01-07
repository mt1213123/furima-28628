FactoryBot.define do
  factory :purchase_address do
    postal_code      { '111-1111' }
    prefecture_id    { 2 }
    city             { '札幌市' }
    block_num        { '札幌1-1-1' }
    building         { '札幌ハイツ101' }
    phone_num        { '08008000800' }
    token            {"tok_abcdefghijk00000000000000000"}
    user_id          { 1 }
    item_id          { 1 }
    purchase_id      { 1 }
  end
end
