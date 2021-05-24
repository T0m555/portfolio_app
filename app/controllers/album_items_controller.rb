class AlbumItemsController < ApplicationController
  
  def new
    @album = Album.find(params[:format])
    @album_item = AlbumItem.new
    @items = Item.where.not(id: Album.find(params[:format]).items).where(user_id: current_user.id)
  end

  def create
    @album_item = AlbumItem.new(album_item_params)
    if @album_item.save
      redirect_to album_path(@album_item.album_id)
    else
      @items = Item.where(user_id: current_user.id)
      @album = Album.find(params[:album_item][:album_id])
      render :new
    end
  end

  def destroy
    AlbumItem.find_by(album_id: params[:id],item_id: params[:format]).destroy
    redirect_to album_path
  end

  private

  def album_item_params
    params.require(:album_item).permit(:item_id, :album_id)
  end

end
