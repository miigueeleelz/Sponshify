require "singleton"
require_relative "../models/song"

class SongController

  include Singleton

  def store(song)
    return Song.create(
      code: song["code"],
      title: song["title"],
      artist: song["artist"],
      release_year: song["release_year"],
      genre: song["genre"],
      duration: song["duration"],
      album: song["album"],
      total_views: 0,
    )
  end

  def get(code = nil)
    if code == nil
      response = {
        songs: Song.all
      }
    else
      response = {
        song: Song.where(code: code).first
      }
    end

    return response.to_json
  end

end
