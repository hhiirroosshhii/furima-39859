require 'rails_helper'

RSpec.describe Item, type: :model do
  # インスタンス変数の作成
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)
  end
    
  describe '商品の登録' do
    # 正常系
    context '正常に商品を登録できないとき' do
      it "各要素が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end


    # 異常系
    context '正常に商品を登録できないとき' do
      it 'productが空では登録できない' do
        @item.product = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
    
      it 'explanationが空では登録できない' do
        @item.explanation = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
    
      it 'categoryが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'statusが空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'costが空では登録できない' do
        @item.cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end

      it 'areaが空では登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it 'needdayが空では登録できない' do
        @item.needday_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Needday can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'userが空では登録できない' do
        @item.user_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end

      it 'priceが半角数値以外では登録できない' do
        @item.price = 'あa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceの値が300～9999999では登録できない' do
        @item.price = 10
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceの値が300～9999999では登録できない' do
        @item.price = 10000000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end


end
