require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できない' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '登録済みのemailは登録できない' do
        user = FactoryBot.create(:user)
        another_user = FactoryBot.build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailは＠を含む必要がある' do
        @user.email = @user.email.delete('@')
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが6文字以上でないと登録できない' do
        @user.password = 'aa111'
        @user.password_confirmation = 'aa111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordは半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it 'passwordは半角数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it 'passwordは確認用のpasswordも入力しないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordは確認用のpasswordと一致しないと登録できない' do
        @user.password_confirmation = 'bbb222'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'last_nameは全角でないと登録できない' do
        @user.last_name = 'kkk'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameは全角でないと登録できない' do
        @user.first_name = 'kkk'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'last_name_kanaは半角では登録できない' do
        @user.last_name_kana = 'kkk'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end
      it 'last_name_kanaはひらがなでは登録できない' do
        @user.last_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end
      it 'last_name_kanaは漢字では登録できない' do
        @user.last_name_kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'first_name_kanaは半角では登録できない' do
        @user.first_name_kana = 'kkk'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end
      it 'first_name_kanaはひらがなでは登録できない' do
        @user.first_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end
      it 'first_name_kanaは漢字では登録できない' do
        @user.first_name_kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end
      it 'birth_dayが空だと登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end
    end
    context '新規登録できる' do
      it '全ての値があれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字で６文字以上なら登録できる' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
      it 'last_nameはひらがなでも登録できる' do
        @user.last_name = 'あああ'
        expect(@user).to be_valid
      end
      it 'last_nameはカタカナでも登録できる' do
        @user.last_name = 'アアア'
        expect(@user).to be_valid
      end
      it 'last_nameは漢字でも登録できる' do
        @user.last_name = '漢字'
        expect(@user).to be_valid
      end
      it 'first_nameはひらがなで登録できる' do
        @user.first_name = 'あああ'
        expect(@user).to be_valid
      end
      it 'first_nameはカタカナで登録できる' do
        @user.first_name = 'アアア'
        expect(@user).to be_valid
      end
      it 'first_nameは漢字で登録できる' do
        @user.first_name = '漢字'
        expect(@user).to be_valid
      end
      it 'last_name_kanaはカタカナで登録できる' do
        @user.last_name_kana = 'アアア'
        expect(@user).to be_valid
      end
      it 'first_name_kanaはカタカナで登録できる' do
        @user.first_name_kana = 'アアア'
        expect(@user).to be_valid
      end
    end
  end
end
