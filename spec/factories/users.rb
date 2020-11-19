FactoryBot.define do
  factory :user do
    nickname              { 'はな' }
    email                 { Faker::Internet.free_email }
    password              { '123abc' }
    password_confirmation { password }
    first_name            { '山田' }
    last_name             { '花子' }
    first_name_reading    { 'ヤマダ' }
    last_name_reading     { 'ハナコ' }
    birthday              { '1999-03-27' }
  end
end
