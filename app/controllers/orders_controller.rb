class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    # binding.pry
    @item = Item.find(params[:item_id])
    # @order_payment = OrderPayment.new
  end

  def create
    @item = Item.find(params[:item_id])
    # @order = OrderPayment.new(order_params)
    # if  @order_payment.valid?
    #    @order_payment.save
    #    redirect_to root_path
    # else
    #   render :index
    # end
  end


  private

  def order_params
    params.require(:order_payment).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number,).merge(user_id: current_user.id, item_id: item.id)
  end

end
