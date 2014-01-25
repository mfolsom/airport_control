class AirTrafficControl 

	def initialize(airport)
		@airport = airport
	end

	def landing_clearance_for(plane)
		@airport.open_runway_for(plane)
	end

	def no_clearance_for(plane)
		@airport.close_runway_for(plane)
	end

end