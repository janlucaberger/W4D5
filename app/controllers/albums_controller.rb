class AlbumsController < ApplicationController
  before_action :ensure_logged_in

  def delete
    destroy
  end

  def create
    album = Album.new(album_params)
    # debugger
    if album.save
      flash[:success] = ["Created #{album.name}!"]
      redirect_to bands_url
    else
      flash[:errors] = album.errors.full_messages
      redirect_to new_album_url
    end
  end

  def new
    @band = Band.new
    if params[:band_id]
      @band = Band.find(params[:band_id])
    end
    render :new
  end

  def show
    @album = Album.find(params[:id])
  end

  def update
  end

  def destroy
    album = Album.find(params[:id])
    band_id = album.band_id
    album.destroy
    redirect_to band_url(band_id)
  end

  private

  def album_params
    params.require(:album).permit(:image, :band_id, :name)
  end
end
