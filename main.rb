require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'base64'
require './image_cache.rb'

image_cache = ImageCache.new

post '/get' do
  request.body.rewind
  data = JSON.parse request.body.read
  url = data['url']
  image_data = image_cache.get url
  json = { url: url, image_data: Base64.encode64(image_data)}
  content_type :json, :charset => 'base64'
  json.to_json
end

get '/' do
  "welcome"
end
