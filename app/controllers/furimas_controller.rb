class FurimasController < ApplicationController
  before_action :move_to_index, except: %i[index show]

  def index; end

  def new
    @furima = Furima.new
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
