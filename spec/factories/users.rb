FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}

    last_name{"鈴木"}
    first_name{"健太郎"}
    last_name_kana{"すずき"}
    first_name_kana{"けんたろう"}
    birthday{"2000-10-11"}
  end
end