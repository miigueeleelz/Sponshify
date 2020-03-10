require "sinatra"
require "mongoid"
require "json"

require_relative "./controllers/song_controller"

before do
  Mongoid.load! "mongoid.conf"
end

get "/" do
  return "Welcome to Sponshify"
end

post "/songs" do
  payload = JSON.parse request.body.read

  controller = SongController.instance
  song = controller.store payload

  if song.valid?
    response.headers['Location'] = "#{request.base_url}/songs/#{song.id}"
    status 201
  else
    response = {
      errors: song.errors
    }
  
    status 422
    body response.to_json
  end
end

get "/songs" do
  controller = SongController.instance
  if params['code']
    return controller.get params['code']
  end
  return controller.get
end
