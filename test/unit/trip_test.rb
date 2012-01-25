require_relative "../test_helper"

describe Trip do
	include TestHelper
	describe "general" do 
		it "should be able to represent itself as a string" do
			trip = Factory.build(:trip)			
			assert trip.to_s
		end

		it "can save if not null" do
			t = Factory.build(:trip)
			assert t.save
		end
	end 

	describe "duration" do		
		it "must not be nil" do
			t = Factory.build(:trip, :duration => nil)
			refute t.save
		end		
	end

	describe "start_location" do
		it "should match the last point in the points array" do
			t = Factory.build(:trip)
			loc = t.start_location 
			refute_nil(loc)
			assert_equal(loc, t.points.first.location)			
		end
	end

	describe "end_location" do
		it "must not be nil" do
			t = Factory.build(:trip)
			loc = t.end_location
			refute_nil(loc)
			assert_equal(loc, t.points.last.location)
		end
	end

	describe "points" do 
		it "must not be nil" do
			t = Factory.build(:trip, :points => nil)
			refute t.save
		end
		
		it "must not be empty" do
			t = Factory.build(:trip, :points => [])
			refute t.save
		end
	end
end