require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '新規出品できない' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "titleが空だと登録できない" do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end
      it "conceptが空だと登録できない" do
        @item.concept = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Concept can't be blank"
      end
      it "category_idが1だと登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it "status_idが1だと登録できない" do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Status must be other than 1"
      end
      it "fee_idが1だと登録できない" do
        @item.fee_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Fee must be other than 1"
      end
      it "prefecture_idが1だと登録できない" do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it "schedule_idが1だと登録できない" do
        @item.schedule_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include "Schedule must be other than 1"
      end
      it "priceが300より小さいと登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it "priceが9999999より大きいと登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it "priceは全角数字では登録できない" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it "priceはひらがなでは登録できない" do
        @item.price = "あああ"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it "priceはカタカナでは登録できない" do
        @item.price = "アアア"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it "priceは漢字では登録できない" do
        @item.price = "漢字"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it "priceは半角英字では登録できない" do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
    end
    context '新規出品できる' do
      it '全ての値が登録できれば出品できる' do
        expect(@item).to be_valid
      end
      it 'priceは300以上なら登録できる' do
        @item.price = "300"
        expect(@item).to be_valid
      end
      it 'priceは9999999以下なら登録できる' do
        @item.price = "9999999"
        expect(@item).to be_valid
      end
      it 'priceは半角数字で登録できる' do
        @item.price = "300"
        expect(@item).to be_valid
      end
    end
  end
end
