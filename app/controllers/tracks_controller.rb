class TracksController < ApplicationController
  before_action :ensure_logged_in

  def new
  end

  def create
  end

  def edit
  end

  def show
    @track = Track.find(params[:id])
  end

  def update
  end

  def destroy
  end


end
