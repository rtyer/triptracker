require 'bundler'
Bundler.require

require 'yaml' 

#App entry point
class TripTracker < Sinatra::Base; end;

require_relative 'config/config'
  
Dir.glob("app/**/*.rb").each { |r| require_relative r }

class TripTracker
  
end