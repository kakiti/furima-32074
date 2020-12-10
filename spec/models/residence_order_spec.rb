require 'rails_helper'

RSpec.describe ResidenceOrder, type: :model do
  before do
    @residence_order = FactoryBot.build(:residence_order)
  end

  describe '商品購入機能' do
    context '購入できない' do
      it 'tokenが空だと購入できない' do
        @residence_order.token = nil
        @residence_order.valid?
        expect(@residence_order.errors.full_messages).to include "Token can't be blank"
      end
      it 'postal_codeが空だと購入できない' do
        @residence_order.postal_code = ""
        @residence_order.valid?
        expect(@residence_order.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeはハイフン(-)がないと購入できない' do
        @residence_order.postal_code = "8100801"
        @residence_order.valid?
        expect(@residence_order.errors.full_messages).to include "Postal code is invalid"
      end
      it 'postal_codeは3桁-4桁の数字組み合わせでないと購入できない' do
        @residence_order.postal_code = "11-11"
        @residence_order.valid?
        expect(@residence_order.errors.full_messages).to include "Postal code is invalid"
      end
      it 'postal_codeは半角英語では購入できない' do
        @residence_order.postal_code = "aaa-aaaa"
        @residence_order.valid?
        expect(@residence_order.errors.full_messages).to include "Postal code is invalid"
      end
      it 'postal_codeは全角数字では購入できない' do
        @residence_order.postal_code = "１１１−１１１１"
        @residence_order.valid?
        expect(@residence_order.errors.full_messages).to include "Postal code is invalid"
      end
      it 'prefecture_idが1だと購入できない' do
        @residence_order.prefecture_id = '1'
        @residence_order.valid?
        expect(@residence_order.errors.full_messages).to include 'Prefecture must be other than 1'
      end
      it 'cityが空だと購入できない' do
        @residence_order.city = ""
        @residence_order.valid?
        expect(@residence_order.errors.full_messages).to include "City can't be blank"
      end
      it 'addressが空だと購入できない' do
        @residence_order.address = ""
        @residence_order.valid?
        expect(@residence_order.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_numberが空だと購入できない' do
        @residence_order.phone_number = ""
        @residence_order.valid?
        expect(@residence_order.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberは12桁以上だと購入できない' do
        @residence_order.phone_number = "000000000000"
        @residence_order.valid?
        expect(@residence_order.errors.full_messages).to include "Phone number is invalid"
      end
      it 'phone_numberは半角英語だと購入できない' do
        @residence_order.phone_number = "aaaaaaaaaaa"
        @residence_order.valid?
        expect(@residence_order.errors.full_messages).to include "Phone number is invalid"
      end
      it 'phone_numberは全角数字だと購入できない' do
        @residence_order.phone_number = "０００００００００００"
        @residence_order.valid?
        expect(@residence_order.errors.full_messages).to include "Phone number is invalid"
      end
    end
    context '購入できる' do
      it '全ての値があれば購入できる' do
        expect(@residence_order).to be_valid
      end
      it 'postal_codeは半角数字の3桁-4桁の組み合わせで購入できる' do
        @residence_order.postal_code = "111-1111"
        expect(@residence_order).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @residence_order.building = ""
        expect(@residence_order).to be_valid
      end
      it 'phone_numberは10桁以下でも購入できる' do
        @residence_order.phone_number = "0000000000"
        expect(@residence_order).to be_valid
      end
    end
  end
end
