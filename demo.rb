require 'json'
require 'uri'
require 'net/http'
require 'pp'
require 'base64'

uri = URI.parse('http://localhost:4567/get')

response = nil

request = Net::HTTP::Post.new(uri.request_uri, initheader = {'Content-Type' =>'application/json'})
request.body = {"url":"http://www.sinatrarb.com/images/logo.png"}.to_json

http = Net::HTTP.new(uri.host, uri.port)

http.start do |h|
  response = h.request(request)
end

if response.code == '200'
  result = JSON.parse(response.body)
  raw = Base64.decode64(result["image_data"])
  File.open("output", "w") do |file|
    file.puts(raw);
  end
else
  puts "ERROR"
end
