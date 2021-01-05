class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @item = Item.all
    @items = Item.includes(:user)
  end
  
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

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
  if current_user.id == @item.user_id
      @item.update(item_params)
      redirect_to item_path, method: :get
  else
      render :edit
  end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :image, :category_id, :condition_id, :prefecture_id, :fee_id, :days_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
