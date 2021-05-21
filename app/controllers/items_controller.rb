class ItemsController < ApplicationController
before_action :genres_set
  
  def index
    @items = Item.where(user_id: current_user.id)
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])

    dels = AlbumItem.where(item_id: @item.id)
    dels.each do |del|
      del.destroy if del
    end
    @item.destroy
    redirect_to items_path
  end

  

  private

  def item_params
    params.require(:item).permit(:title, :url, :genre_id).merge(user_id: current_user.id)
  end

  def genres_set
    @item = Item.new
    @genres = Genre.all
  end

end