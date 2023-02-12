class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:index, :create]

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :area_id, :city, :house_number, :building, :tel_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_order
    @item = Item.find(params[:item_id])
    # ログイン状態の場合でも、自身が出品していない売却済み商品の商品購入ページへ遷移しようとすると、トップページに遷移する。
    # ログイン状態の場合でも、自身が出品した商品の商品購入ページに遷移しようとすると、商品の販売状況に関わらずトップページに遷移する。
    redirect_to root_path if current_user.id == @item.user_id || @item.order != nil
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 秘密鍵
      Payjp::Charge.create(
        amount: @item.price,        # 商品の値段
        card: order_params[:token], # トークン
        currency: 'jpy'             # 通貨の種類(日本円)  
      )
    end
end
