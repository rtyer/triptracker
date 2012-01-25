class Trip
	include Mongoid::Document	
	field :duration, type: Integer
	embeds_many :points

	validates_presence_of [:duration, :points]

	def start_location
		points.first.location
	end

	def end_location
		points.last.location
	end

	def to_s
		"Trip { \n\tstart_location : #{start_location}\n\tend_location : #{end_location} \n\tduration : #{duration}\n\tpoints : #{points.join("\n\t\t ")}\n}"
	end
end