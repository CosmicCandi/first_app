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
  lorems = Lorem.find_by(name: params['lipsum']).name
  "#{lorem.name("bacon")}"
  "#{lorem.name("pirate")}"
  "#{lorem.name("sagan")}"
end

get "/:name" do
  "Hi there, #{params['name'].capitalize}"
end

get '/lorem/:name' do
  if Lorem.find_by(name: params["bacon"])
    p "#{Lorem.find_by(name: params['bacon'])}.inspect"
  elsif Lorem.find_by(name: params["pirate"])
    p "#{Lorem.find_by(name: params['pirate'])}.class"
  elsif Lorem.find_by(name: params["sagan"])
    p "#{Lorem.find_by(name: params['sagan'])}.paragraph"
  end
end
