class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @albums = Album.where(user_id: current_user.id)
  end


  def show
    @items = Album.find(params[:id]).items
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @album.update(album_params)
      redirect_to album_path
    else
      render :edit
    end
  end

  def destroy
    dels = AlbumItem.where(album_id: @album.id)
    dels.each do |del|
      del.destroy if del
    end
    @album.destroy
    redirect_to root_path
  end

  private

  def album_params
    params.require(:album).permit(:title).merge(user_id: current_user.id)
  end

  def set_album
    @album = Album.find(params[:id])
  end

end