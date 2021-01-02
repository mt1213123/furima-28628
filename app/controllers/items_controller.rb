class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def new
    @item = Item.new
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
    params.require(:item).permit(:title, :description, :image, :category_id, :condition_id, :prefecture_id, :fee_id, :days_id, :price).merge(user_id: current_user.id)
  end
end
