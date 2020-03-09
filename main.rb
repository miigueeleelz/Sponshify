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
  response = controller.store payload

  return response
end
