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

	describe "start_location" do		
		it "must not be nil" do
			t = Factory.build(:trip, :start_location => nil)
			refute t.save
		end
	end

	describe "end_location" do
		it "must not be nil" do
			t = Factory.build(:trip, :end_location => nil)
			refute t.save
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