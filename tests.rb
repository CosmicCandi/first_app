require 'rubygems'
require 'bundler/setup'
ENV['RACK_ENV'] = 'test'

require_relative 'first_app'
require 'test/unit'
require 'rack/test'
require 'faker'

class FirstAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_the_index
    get '/'
    assert last_response.ok?
    assert_equal 'Hello World', last_response.body
  end

  def test_names_page
    name = Faker::Name.first_name
    get "/#{name}"
    assert last_response.ok?
    assert_equal "Hi there, #{name}", last_response.body
  end

  def test_lipsums_page
    get "/lipsum"
    assert_equal 200, last_response.status
    assert_equal "You almost had it. <br><br> Try: <br><ul> <li>/lipsum/bacon</li> <br> <li>/lipsum/pirate</li> <br> <li>/lipsum/sagan</li></ul>", last_response.body
  end

  def test_bacon_lipsum
    get "/lipsum/bacon"
    assert last_response.ok?
    assert_equal "bacon".upcase, last_response.body
  end

  def test_pirate_lipsum
    get "/lipsum/pirate"
    assert_equal 200, last_response.status
    assert_equal "pirate", last_response.body
  end

  def test_sagan_lipsum
    get "/lipsum/sagan"
    assert_equal "<h1>sagan</h1>", last_response.body
  end

end
