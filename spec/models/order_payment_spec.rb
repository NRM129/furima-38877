require 'rails_helper'

RSpec.describe OrderPayment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)

    @order_payment = FactoryBot.build(:order_payment, user_id: @user.id, item_id: @item.id)
  end

  context '商品購入できる場合' do
    it 'すべての情報があれば登録できる' do
      expect(@order_payment).to be_valid
    end
  end

  context '商品購入できない場合' do
    it 'user_idが空だと購入できない' do
      @order_payment.user_id = ''
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空だと購入できない' do
      @order_payment.item_id = ''
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("Item can't be blank")
    end

    it 'post_codeが空だと購入できない' do
      @order_payment.post_code = ''
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("Post code can't be blank")
    end

    it 'post_codeが数字のみだと購入できない' do
      @order_payment.post_code = 1_234_567
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include('Post code is invalid')
    end

    it 'prefecture_idが1では登録できない' do
      @order_payment.prefecture_id = 1
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空だと購入できない' do
      @order_payment.city = ''
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空だと購入できない' do
      @order_payment.address = ''
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空だと購入できない' do
      @order_payment.phone_number = ''
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが9桁以下では登録できない' do
      @order_payment.phone_number = 12_345_678
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include('Phone number is invalid')
    end

    it 'phone_numberが12桁以下では登録できない' do
      @order_payment.phone_number = 123_456_789_012
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include('Phone number is invalid')
    end

    it 'tokenが空では登録できないこと' do
      @order_payment.token = nil
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("Token can't be blank")
    end
  end
end
