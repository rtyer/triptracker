FactoryGirl.define do

	factory :point do |p|
		p.time Date.new
		p.location [1,2]
	end

	factory :trip do |t|
		t.duration 1800
		t.start_location [39.97544740000001, -105.0952801]
		t.end_location [40, -106]
		t.points {|points|
			[points.association(:point, :location=>[39.97544740000001, -105.0952801]), 
			points.association(:point, :location=>[39.99, -105.5]),
			points.association(:point, :location=>[40, -106])]
		}
	end

	factory :trip_from_web, :class=>'trip' do |t|
		t.duration 1800
		t.points {|points|
			[points.association(:point, :location=>[39.97544740000001, -105.0952801]), 
			points.association(:point, :location=>[39.99, -105.5]),
			points.association(:point, :location=>[40, -106])]
		}
	end
end