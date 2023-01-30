class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item = Category.all
    @item = Postage.all
    @item = Condition.all
    @item = Prefecture.all
    @item = Reparation.all
  end

  def create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def prototype_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id, :preparation_id, :price).merge(user_id: current_user.id)
  end

end
