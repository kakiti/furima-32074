class ItemsController < ApplicationController
  before_action :move_to_login, only: [:new, :create, :edit, :update]
  before_action :move_to_root, only: [:edit, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :concept, :image, :category_id, :status_id, :fee_id, :prefecture_id, :schedule_id, :price).merge(user_id: current_user.id)
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_root
    @item = Item.find(params[:id])
    if @item.order || @item.user != current_user
      redirect_to root_path
    end
  end
end
