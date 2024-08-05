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

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/jpeg')
    end
  end
end
