class ChangeLyricsType < ActiveRecord::Migration
  def change
    change_column :tracks, :lyrics, :text
  end
end
