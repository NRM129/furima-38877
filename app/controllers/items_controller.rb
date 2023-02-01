class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      binding.pry
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id,
                                 :preparation_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    return if user_signed_in?

    redirect_to action: :index
  end
end
