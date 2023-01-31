require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it '全ての情報が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'imageが空では登録できない' do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "item_name can't be blank"
      end

      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "explanation can't be blank"
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "price can't be blank"
      end

      it 'category_idが空では登録できない' do
        @item.category = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "category can't be blank"
      end

      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "condition_id can't be blank"
      end

      it 'postage_idが空では登録できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "postage_id can't be blank"
      end

      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "prefecture_id can't be blank"
      end

      it 'preparation_idが空では登録できない' do
        @item.preparation_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "preparation_id can't be blank"
      end


  end