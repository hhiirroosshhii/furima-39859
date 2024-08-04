FactoryBot.define do
  factory :item do
    product              {'商品テスト'}
    explanation          {'こちらの商品は実にいいものです。'}

    category_id     {2}
    status_id       {2}
    cost_id         {2}
    area_id         {2}
    needday_id      {2}
    price           {1000}
    association :user
  end
end
