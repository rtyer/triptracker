require 'JSON'
require 'rack/test'
require_relative '../test_helper'

describe "trip resource tests" do
	include TestHelper
	include Rack::Test::Methods

	it "can list trips when a get request is made to root" do
		t = Factory(:trip, :start_location => [1,2])
		t2 = Factory(:trip, :start_location => [3,4])

		get '/trips'

		assert last_response.ok?, "status not 200"
		
		trips = JSON.load(last_response.body)
		
		assert_equal trips.size, 2
		assert_equal trips[0]['start_location'], [1,2]
		assert_equal trips[0]['points'].size, 3
		assert_equal trips[1]['start_location'], [3,4]
	end		

	it "will return the correct trip for an id at /trips/<id>" do
		trip = Factory(:trip)
		get "/trips/#{trip.id}"

		assert last_response.ok?, "status not 200"

		jsonTrip = JSON.load(last_response.body)
		assert_equal trip.start_location, jsonTrip['start_location']
	end

	it "can save a new trip" do
		trip = Factory(:trip)
		post '/trips', trip.to_json

		assert_equal 201, last_response.status
		refute_nil(last_response.header['Location'])
		assert last_response.header['Location'].ends_with?(trip.id.to_s)

		jsonTrip = JSON.load(last_response.body)
   		assert_equal jsonTrip['end_location'], trip.end_location
   		for i in 0...trip.points.size	   	
   			assert_equal jsonTrip['points'][i]['location'], trip.points[i].location
   		end
	end
end