class Point
	include Mongoid::Document
	field :time, type: DateTime
	field :location, type: Array

	def to_s
		"loc: #{location} at #{time}"
	end
end