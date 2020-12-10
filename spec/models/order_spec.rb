require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入機能' do
    context '購入できない' do
      it 'tokenが空だと登録できない' do
        @order.token = nil
        @order.valid?
        binding.pry
      end
    end
    context '購入できる' do
      it 'tokenがあれば登録できる' do
      end
    end
  end

end
