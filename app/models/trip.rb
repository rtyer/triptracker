class Trip
	include Mongoid::Document
	include Mongoid::Spacial::Document
		
	field :duration, type: Integer
	field :start_location, type: Array, spacial: true
	field :end_location, type: Array, spacial: true
	embeds_many :points

	spacial_index :start_location
	spacial_index :end_location

	validates_presence_of [:duration, :start_location, :end_location, :points]	

	def initialize(attrs = nil, options = nil)
		super(attrs, options)	
		if points && points.size() > 0
			attributes['start_location'] = points.first.location
			attributes['end_location'] = points.last.location
		end
	end

	def to_s
		"Trip { \n\tstart_location : #{start_location}\n\tend_location : #{end_location} \n\tduration : #{duration}\n\tpoints : #{points.join("\n\t\t ")}\n}"
	end
end