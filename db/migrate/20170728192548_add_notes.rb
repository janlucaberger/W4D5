class AddNotes < ActiveRecord::Migration
  def change
    add_column :notes, :note_text, :text, null: false
  end
end
