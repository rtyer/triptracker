require 'bundler/setup'

#Pulls in the main sinatra app.  
#require_relative won't work here: https://github.com/rack/rack/issues/115
require File.dirname(__FILE__) + '/trip_tracker'

#Runs the main sinatra app under '/' path
map "/" do
  run TripTracker
end
