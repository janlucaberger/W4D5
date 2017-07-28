class AddRecordingTypeToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :rec_type, :string  
  end
end
