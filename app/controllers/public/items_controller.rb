class Public::ItemsController < ApplicationController
  def index
    if params[:name].present?
      @items = Item.where("name LIKE ?", "%#{params[:name]}%").page(params[:page])
      @genres = Genre.all
    elsif params[:genre_name].present?
      genre = Genre.find_by(name: params[:genre_name])
      @items = Item.where(genre_id: genre.id).page(params[:page])
      @genres = Genre.all
    else
      @items = Item.page(params[:page]).per(8)
      @genres = Genre.all
    end
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
end
