class NotesController < ApplicationController

  def show
  end

  def create
    notes = current_user.notes.new(note_params)
    notes.track_id = params[:track_id]
    if notes.save
      redirect_to track_url(notes.track.id)
    else
      flash[:errors] = notes.errors.full_messages
      redirect_to track_url(notes.track.id)
    end
  end

  def new
  end

  def delete

  end

  def destroy
    @note = Note.find(params[:id])
    @track_id = @note.track_id
    if current_user.id == @note.user_id
      @note.destroy
      redirect_to track_url(@track_id)
    else
      flash[:errors] = ["You can only delete your own comments"]
      redirect_to track_url(@track_id)
    end
  end

  def update
  end

  private

  def note_params
    params.require(:note).permit(:note_text)
  end
end
