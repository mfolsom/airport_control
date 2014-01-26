require_relative "weather"
require_relative "airport"
require_relative "plane"

class AirTrafficControl < Airport
	include Weather

	attr_accessor :airport, :weather_conditions, :plane_status

	def initialize(args)
		@airport            = args[:airport]
		@weather_conditions = args[:weather_conditions]
		@plane_status       = args[:plane_status]
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

	def close_runway_in_bad_weather(plane)
		no_clearance_for(plane) if @weather_conditions == :stormy
	end

	def open_runway_in_good_weather(plane)
		landing_clearance_for(plane) if not @weather_conditions == :stormy
	end

end