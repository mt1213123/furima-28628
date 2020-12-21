class ItemController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end
end
