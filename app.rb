require 'sinatra'
require 'json'

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
