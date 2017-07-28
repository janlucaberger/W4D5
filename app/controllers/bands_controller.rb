class BandsController < ApplicationController
  before_action :ensure_logged_in

  def index
    @bands = Band.all
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      flash[:success] = ["Created #{@band.name}!"]
      redirect_to bands_url
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def new
    @band = Band.new
  end

  def new_album
    redirect_to url_for(
      controller: :albums,
      action: new_album_from_band(params[:id])
    )
  end

  def edit
  end

  def show
    @band = Band.find(params[:id])
    # @band = Band.where(id: params[:id]).includes(:albums)
    # debugger
  end

  def update
  end

  def destroy
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end
