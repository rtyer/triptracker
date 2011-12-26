require 'bundler/setup'

#Pulls in the main sinatra app.  
#require_relative won't work here: https://github.com/rack/rack/issues/115
require File.dirname(__FILE__) + '/trip_tracker'
require File.dirname(__FILE__) + '/static'

#Runs the main sinatra app under '/' path
map "/api" do
  run TripTracker
end

map "/" do
  run Static
end
