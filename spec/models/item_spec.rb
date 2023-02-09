require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it '全ての情報が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
  end

  context '商品出品できないとき' do
    it 'userが紐付いていなければ登録できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Userを入力してください')
    end

    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "商品画像を入力してください"
    end

    it 'item_nameが空では登録できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "商品名を入力してください"
    end

    it 'explanationが空では登録できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "商品説明を入力してください"
    end

    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "販売価格を入力してください"
    end

    it 'priceが300円以下では登録できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include '販売価格は300以上の値にしてください'
    end

    it 'priceが9999999円以上では登録できない' do
      @item.price = '1,000,000'
      @item.valid?
      expect(@item.errors.full_messages).to include '販売価格は数値で入力してください'
    end

    it 'priceが全角では登録できない' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include '販売価格は数値で入力してください'
    end

    it 'category_idが1では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "カテゴリーを選択してください"
    end

    it 'condition_idが1では登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "商品の状態を選択してください"
    end

    it 'postage_idが1では登録できない' do
      @item.postage_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "配送料の負担を選択してください"
    end

    it 'prefecture_idが1では登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "発送元の地域を選択してください"
    end

    it 'preparation_idが1では登録できない' do
      @item.preparation_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "発送までの日数を選択してください"
    end
  end
end
