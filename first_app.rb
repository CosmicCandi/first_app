require 'active_record'
require 'bundler/setup'
require 'sinatra'
require 'sqlite3'

require_relative 'lipsum'

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "lipsum_db.sqlite3"
)

get '/' do
  'Hello World'
end

get '/not_found' do
  status 404
  "We were unable to find that page, sorry for any inconvenience."
end

get "/lipsum" do
  status 200
  lipsum = Lipsum.all
  lipsum.each do |l|
    puts "#{l} <br>"
  end  
end

get "/:name" do
  "Hi there, #{params['name'].capitalize}"
end

get '/lipsum/:name' do
  case params[:name]
  when "bacon"
      p "bacon".upcase
    when "pirate"
      p "pirate"
    when "sagan"
      p "<h1>sagan</h1>"
  end
end
