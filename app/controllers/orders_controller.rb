class OrdersController < ApplicationController
  def index
    # @orders = Order.new.includes(:user, :item)
    # @orders = Order.new(order_params)
     @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end


  private
  def order_params
    params.require(:order).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
