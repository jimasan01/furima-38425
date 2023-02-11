class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:index, :create]

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :area_id, :city, :house_number, :building, :tel_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

end
