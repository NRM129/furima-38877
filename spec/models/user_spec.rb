require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    # context '新規登録できるとき' do
    #   it '全ての情報が存在すれば登録できる' do
    #     @user = '' 
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include "user can't be blank"
    #   end
    # end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
         
      it 'emailが空では登録できない' do
        @user.email = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include"Email has already been taken"
      end


      it 'emailは@を含まないと登録できない' do
        @user.email = "user.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include"Email is invalid"
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include"Password can't be blank"
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'a123456' 
        @user.password_confirmation = 'a1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include"Password confirmation doesn't match Password"
      end
      

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000' 
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'first_nameが空では登録できない' do
      @user.first_name = '' 
          @user.valid?
          expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'first_nameが半角では登録できない' do
        @user.first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = '' 
            @user.valid?
            expect(@user.errors.full_messages).to include "Last name can't be blank"
        end
  
        it 'last_nameが半角では登録できない' do
          @user.last_name = 'aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include "Last name is invalid"
        end

      it 'birthdayが空では登録できない' do
      @user.birthday = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
