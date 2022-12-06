require 'sinatra'
require 'json'

# curl -XPOST -F "data=@test.log" https://...
post '/' do
  File.open("tmp/#{Time.now.to_i}", 'w+') do |file|
    loop do
      line = params[:data][:tempfile].read
      break if line.empty?

      file.puts line
    end
  end
  { message: 'finished!' }.to_json
end
