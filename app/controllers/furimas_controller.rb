class FurimasController < ApplicationController
  before_action :move_to_index, except: %i[index show]

  def index; 
    @item = Item.all
    @items = Item.includes(:user)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
