FactoryBot.define do
  factory :order_info do
    postal { '123-4567' }
    locate { 5 }
    city { '横浜市緑区' }
    address { '青山1-1-1' }
    building { '柳ビル103' }
    phone { '09088777890' }

  end
end
