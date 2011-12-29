class Trip
	include Mongoid::Document
	field :start_location, type: Array
	field :end_location, type: Array
	embeds_many :points

	validates_presence_of [:start_location, :end_location, :points]

	def to_s
		"Trip { \n\tstart_location : #{start_location}\n\tend_location : #{end_location} \n\tpoints : #{points.join("\n\t\t ")}\n}"
	end
end