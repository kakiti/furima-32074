class OrdersController < ApplicationController
  before_action :set_item
  before_action :move_to_root
  before_action :move_to_login

  def index
    @residence_order = ResidenceOrder.new
  end

  def create
    @residence_order = ResidenceOrder.new(order_params)
    if @residence_order.valid?
      pay_item
      @residence_order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private

  def order_params
    params.require(:residence_order).permit(:price, :postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def move_to_root
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.order
      redirect_to root_path
    end
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
