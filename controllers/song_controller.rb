require "singleton"
require_relative "../models/song"

class SongController

  include Singleton

  def store(song)
    result = Song.create(
      code: song["code"],
      title: song["title"],
      artist: song["artist"],
      release_year: song["release_year"],
      genre: song["genre"],
      duration: song["duration"],
      album: song["album"],
      total_views: 0,
    )

    if result.valid?
      response = {
        message: 'Song created successfully'
      }
      return [201, {}, response.to_json]
    end

    response = {
      errors: result.errors
    }
    return [422, {}, response.to_json]
  end

  def get
    response = {
      songs: Song.all
    }
    return [200, {}, response.to_json]
  end

end
