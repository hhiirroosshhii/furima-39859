class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index

    @item = Item.find(params[:item_id])
    @order_info = OrderInfo.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_info = OrderInfo.new(order_params)

    if @order_info.valid?
      @order_info.save
      return redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end


  private
  def order_params
    params.require(:order_info).permit(:postal, :locate, :city, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[item_id])
  end
end
