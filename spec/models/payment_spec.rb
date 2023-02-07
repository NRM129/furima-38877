require 'rails_helper'

RSpec.describe Payment, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @payment = FactoryBot.build(:payment, user_id: @user.id, product_id: @item.id)
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば購入できること' do
      expect(@payment).to be_valid
    end
    it '建物名が空でも購入できること' do
      @payment.building_name = ''
      expect(@payment).to be_valid
    end
  end

  context '商品購入できないとき' do
    it '郵便番号は空では購入できない' do
      @@payment.post_code = ''
      @payment.valid?
      expect(@payment.errors.full_messages).to include("Post code can't be blank")
    end
    #    it '郵便番号は『３桁ハイフン４桁』半角英数字でないと保存できないこと' do
    #      @payment.post_code = '123-123４'
    #      @payment.valid?
    #      expect(@payment.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    #    end
    #    it '都道府県に「---」が選択されている場合は購入できないこと' do
    #      @payment.prefecture_id = '1'
    #      @payment.valid?
    #      expect(@payment.errors.full_messages).to include("Prefecture can't be blank")
    #    end
    #    it '市区町村が空だと購入できないこと' do
    #      @payment.city = ''
    #      @payment.valid?
    #      expect(@payment.errors.full_messages).to include("City can't be blank")
    #    end
    #    it '番地が空だと購入できないこと' do
    #      @payment.address = ''
    #      @payment.valid?
    #      expect(@payment.errors.full_messages).to include("Address can't be blank")
    #    end
    #    it '電話番号が空だと購入できないこと' do
    #      @payment.phone_number = nil
    #      @payment.valid?
    #      expect(@payment.errors.full_messages).to include("Phone number can't be blank")
    #    end
    #    it '電話番号が9桁以下だと購入できないこと' do
    #      @payment.phone_number = '090123456'
    #      @payment.valid?
    #      expect(@payment.errors.full_messages).to include("Phone number is invalid")
    #    end
    #    it '電話番号が12桁以上だと購入できない' do
    #      @payment.phone_number = '090123456789'
    #      @payment.valid?
    #      expect(@payment.errors.full_messages).to include("Phone number is invalid")
    #    end
    #    it '電話番号が半角数値でないと購入できないこと' do
    #      @payment.phone_number = '０9012341234'
    #      @payment.valid?
    #      expect(@payment.errors.full_messages).to include("Phone number is invalid")
    #    end
    #    it 'tokenが空では購入できないこと' do
    #      @payment.token = nil
    #      @payment.valid?
    #      expect(@payment.errors.full_messages).to include("Token can't be blank")
    #    end
    #    it 'user_idが紐づいていなければ購入できないこと' do
    #      @payment.user_id = ''
    #      @payment.valid?
    #      expect(@payment.errors.full_messages).to include("User can't be blank")
    #    end
    #    it 'product_idが紐づいていなければ購入できないこと' do
    #      @payment.product_id = ''
    #      @payment.valid?
    #      expect(@payment.errors.full_messages).to include("Product can't be blank")
    #    end

    #  end
  end
end
