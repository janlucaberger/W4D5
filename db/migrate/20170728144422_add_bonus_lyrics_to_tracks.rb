class AddBonusLyricsToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :lyrics, :string
    add_column :tracks, :bonus, :boolean, default: false 
  end
end
