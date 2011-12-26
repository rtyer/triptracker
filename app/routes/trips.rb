class TripTracker
	get "/trips" do
		puts "entered trips"
	end

	get "/trips/:id" do |id|
		puts "entered trips with id: #{id}"
	end

end