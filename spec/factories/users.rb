FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example.com' }
    password              { 'abc000' }
    password_confirmation { password }
    family_name           { '山田' }
    first_name            { '太郎' }
    kanafamily_name       { 'ヤマダ' }
    kanafirst_name        { 'タロウ' }
    birth_day             { '1996-02-02' }
  end
end
