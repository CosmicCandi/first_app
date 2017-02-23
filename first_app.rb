require 'active_record'
require 'bundler/setup'
require 'sinatra'
require 'sqlite3'
require_relative 'lorem'

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "lorem_db.sqlite3"
)

get '/' do
  'Hello World'
end

get '/not_found' do
  status 404
  "We were unable to find that page, sorry for any inconvenience."
end

get "/lorem" do
  status 200
  "You almost had it.  Try <ul><li>/lorems/bacon</li> <li>/lorems/pirate</li><li>/lorems/sagan</li></ul>"
end

get "/:name" do
  "Hi there, #{params['name'].capitalize}"
end

get '/lorem/:name' do
  Lorem.find_by(name: params['name']).paragraph
end
