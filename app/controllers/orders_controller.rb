class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create

    @item = Item.find(params[:item_id])

    @order = Order.create(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end


  private
  def order_params
    params.require(:order_info).permit(:postal, :area_id, :city, :address, :building, :phone).merge(user_id: @user_id, item_id: @item.id)
  end
end
