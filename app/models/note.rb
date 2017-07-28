class Note < ActiveRecord::Base

  validates :user_id, :note_text, :track_id, presence: true

  belongs_to :user
  belongs_to :track

  has_one :album,
  through: :track

  has_one :band,
  through: :album

end
