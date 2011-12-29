require 'minitest/autorun'
ENV['RACK_ENV'] = 'test'
require 'bundler'
Bundler.setup
Bundler.require(:default, :test)

#other requires here
require_relative 'factories'
require_relative '../trip_tracker'

module TestHelper
  def app() TripTracker end
    
  def setup
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.start
  end
  
  def teardown 
    DatabaseCleaner.clean
  end
end