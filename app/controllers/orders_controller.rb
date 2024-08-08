class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order = Order.new
  end

  def create
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
    params.require(:order_info).permit(:postal, :area_id, :city, :address, :building, :phone).merge(order_id: @order_id)
  end

end
