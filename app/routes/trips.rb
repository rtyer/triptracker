require 'JSON'

class TripTracker
	get "/trips" do
		Trip.all.to_json
	end

	get "/trips/:id" do |id|
		begin
			trip = Trip.find(id)
			if(trip)
				content_type('application/json')
				trip.to_json
			else
				error 404
			end
		rescue => e
			error 404, e.message.to_json
		end
	end

	post '/trips' do
		begin
			body = request.body.read
			puts "request: #{body}"
			trip = Trip.new(JSON.load(body))
			puts "trip: #{trip}"
			if trip.save
				status 201
				content_type('application/json')
        		headers 'Location'=>url("/trip/#{trip.id}")
        		trip.to_json
        	else
        		status 400
        		content_type('application/json')
        		trip.errors.to_json
        	end
        rescue => e
        	error 400, e.message.to_json
        end
	end
end