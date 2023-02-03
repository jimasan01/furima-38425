class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  def index
    @items = Item.order("created_at DESC")
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
  end

  def edit
    #  ログイン状態の場合でも、自身が出品していない商品の商品情報編集ページへ遷移しようとすると、商品の販売状況に関わらずトップページに遷移する。
    if @item.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    @item.update(item_params)
    if @item.valid? 
       redirect_to item_path(item_params)
    else
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :state_id, :postage_id, :area_id, :sipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
