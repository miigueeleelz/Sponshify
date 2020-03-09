require "mongoid"

class Song

  include Mongoid::Document
  include Mongoid::Timestamps

  field :code, type: Integer
  field :title, type: String
  field :artist, type: String
  field :release_year, type: Integer
  field :genre, type: String
  field :duration, type: Float
  field :album, type: String
  field :total_views, type: Integer

  validates :code, presence: true, uniqueness: true
  validates :title, presence: true
  validates :artist, presence: true
  validates :release_year, presence: true
  validates :genre, presence: true
  validates :duration, presence: true
  validates :album, presence: true
  validates :total_views, presence: true

end
