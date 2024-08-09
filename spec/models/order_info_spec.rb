require 'rails_helper'

RSpec.describe OrderInfo, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_info = FactoryBot.build(:order_info, user_id: user.id, item_id: item.id)
  end

  describe '住所録の保存' do
    # 正常系
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_info).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_info.building = ''
        expect(@order_info).to be_valid
      end
    end

    # 異常系
    context '内容に問題がある場合' do
      it 'postalが空だと保存できない' do
        @order_info.postal = ''
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Postal can't be blank")
      end
      it 'postalが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_info.postal = '1234567'
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include('Postal is invalid. Include hyphen(-)')
      end
      it 'locateを選択していないと保存できない' do
        @order_info.locate = 0
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Locate can't be blank")
      end

      it 'cityが空だと保存できない' do
        @order_info.city = ''
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できない' do
        @order_info.address = ''
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Address can't be blank")
      end


      # it 'priceが空だと保存できないこと' do
        # @order_info.price = nil
        # @order_info.valid?
        # expect(@order_info.errors.full_messages).to include("Price can't be blank")
      # end
      it 'userが紐付いていないと保存できない' do
        @order_info.user_id = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @order_info.item_id = nil
        @order_info.valid?
        expect(@order_info.errors.full_messages).to include("Item can't be blank")
      end


    end
  end









end
