class AirTrafficControl 

	def initialize(airport, weather_conditions)
		@airport = airport
		@weather_conditions = weather_conditions
	end

	def landing_clearance_for(plane)
		@airport.open_runway_for(plane)
	end

	def no_clearance_for(plane)
		@airport.close_runway_for(plane)
	end

	def weather_report(conditions)
		@weather_conditions = conditions
		@airport.weather_conditions
	end
	
end