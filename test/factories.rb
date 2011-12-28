# Factory.define :point do |p|
# 	p.time Date.new
# 	p.location [1,2]
# end

Factory.define :trip do |t|
	t.start_location [39.97544740000001, -105.0952801]
	t.end_location [40, -106]
	# t.points [Factory.build(:point, :location => [1,2])]
end

