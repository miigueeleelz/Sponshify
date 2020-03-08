require "sinatra"
require 'mongoid'

before do
  Mongoid.load! "mongoid.conf"
end

get "/" do
  return "Welcome to Sponshify"
end
