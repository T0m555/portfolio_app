class GenresController < ApplicationController
  def index
    @genres = Genre.all.where.not(id: 1)
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genres_path
    else
      render :new
    end
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to genre_path
    else
      render :edit
    end
  end

  def destroy
    items = Item.where(params[:id])
    unless items == []
      items.each do |item|
        item.update(genre_id: 1)
      end
    end

    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to genres_path

  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
