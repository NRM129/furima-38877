class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
    @item = Category.all
    @item = Postage.all
    @item = Condition.all
    @item = Prefecture.all
    @item = Preparation.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id, :preparation_id, :price).merge(user_id: current_user.id)
  end

end
