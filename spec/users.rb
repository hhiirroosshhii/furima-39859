FactoryBot.define do
  factory :user do
    nickname {"kenta"}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name{"鈴木"}
    first_name{"健太郎"}
    last_name_kana{"すずき"}
    first_name_kana{"けんたろう"}
    birthday{"2000-10-11"}
  end
end
