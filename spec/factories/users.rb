FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.email}
    password              {'00000A'}
    password_confirmation {password}

    last_name{"鈴木"}
    first_name{"健太郎"}
    last_name_kana{"スズキ"}
    first_name_kana{"ケンタロウ"}
    birthday{"2000-10-11"}
  end
end