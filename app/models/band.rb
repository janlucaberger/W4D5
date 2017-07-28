class Band < ActiveRecord::Base

  validates :name, presence: true

  has_many :albums
  has_many :tracks, through: :albums
  has_many :notes, through: :tracks
end
