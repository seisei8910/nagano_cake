class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction,
    :genre_id, :price, :is_active)
  end
end
