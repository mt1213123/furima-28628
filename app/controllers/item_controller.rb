class ItemController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  private 

  def item_params
    binding.pry
    params.require(:item).permit(:title, :description, :image, :category_id, :condition_id, :prefecture_id, :fee_id, :days_id, :price).merge(user_id: current_user.id)
  end
end
