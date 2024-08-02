class ItemsController < ApplicationController
 

  def index
  end

  def edit
  end

  def new
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:product, :explanation, :category_id, :status_id, :cost_id, :area_id, :need_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
