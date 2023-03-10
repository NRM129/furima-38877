class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_order, only: [:index, :create]


  def index
    @order_payment = OrderPayment.new
    if @item.order.present? || current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @order_payment = OrderPayment.new(order_params)
    if  @order_payment.valid?
      pay_item
      @order_payment.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_payment).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token], 
      currency: 'jpy'
      )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end
