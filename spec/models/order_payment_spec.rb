require 'rails_helper'

RSpec.describe OrderPayment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)

    @order_payment = FactoryBot.build(:order_payment, user_id: @user.id, item_id: @item.id)
  end

  context '商品購入できる場合' do
    it 'すべての情報があれば購入できる' do
      expect(@order_payment).to be_valid
    end

    it 'building_nameが空でも購入できる' do
      @order_payment.building_name = ''
      expect(@order_payment).to be_valid
    end
  end

  context '商品購入できない場合' do
    it 'user_idが空だと購入できない' do
      @order_payment.user_id = ''
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("Userを入力してください")
    end

    it 'item_idが空だと購入できない' do
      @order_payment.item_id = ''
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("Itemを入力してください")
    end

    it 'post_codeが空だと購入できない' do
      @order_payment.post_code = ''
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("郵便番号を入力してください")
    end

    it 'post_codeが数字のみだと購入できない' do
      @order_payment.post_code = 1_234_567
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include('郵便番号は不正な値です')
    end

    it 'prefecture_idが1では登録できない' do
      @order_payment.prefecture_id = 1
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("都道府県を選択してください")
    end

    it 'cityが空だと購入できない' do
      @order_payment.city = ''
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("市区町村を入力してください")
    end

    it 'addressが空だと購入できない' do
      @order_payment.address = ''
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("番地を入力してください")
    end

    it 'phone_numberが空だと購入できない' do
      @order_payment.phone_number = ''
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("電話番号を入力してください")
    end

    it 'phone_numberが9桁以下では購入できない' do
      @order_payment.phone_number = 12_345_678
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include('電話番号は不正な値です')
    end

    it 'phone_numberが12桁以下では購入できない' do
      @order_payment.phone_number = 123_456_789_012
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include('電話番号は不正な値です')
    end

    it 'phone_numberが数字以外が含まれている場合は購入できない' do
      @order_payment.phone_number = 'A12_4567_8901'
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include('電話番号は不正な値です')
    end

    it 'tokenが空では購入できないこと' do
      @order_payment.token = nil
      @order_payment.valid?
      expect(@order_payment.errors.full_messages).to include("クレジットカード情報を入力してください")
    end
  end
end
