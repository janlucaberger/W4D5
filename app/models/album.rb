class Album < ActiveRecord::Base

  validates :band_id, :name, presence: true

  belongs_to :band
  has_many :tracks
  has_many :notes, through: :tracks

end
