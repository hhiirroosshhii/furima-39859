class OrdersController < ApplicationController


  def index
     @orders = Order.new
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
    params.require(:order_information).permit(:postal, :area_id, :city, :address, :building, :phone, 
                                              order_id: params[:order_id]).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
