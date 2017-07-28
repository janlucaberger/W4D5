class AddUserIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :user_id, :integer, null: false
  end
end
