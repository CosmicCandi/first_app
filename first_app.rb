require 'sinatra'

get '/' do
  'Hello World'
end

get '/not_found' do
  status 404
  "We were unable to find that page, sorry for any inconvenience."
end

get "/lipsum" do
  status 200
  "You almost had it. <br><br> Try: <br><ul> <li>/lipsum/bacon</li> <br> <li>/lipsum/pirate</li> <br> <li>/lipsum/sagan</li></ul>"
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
