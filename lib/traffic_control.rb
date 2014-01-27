require_relative "weather"
require_relative "airport"
require_relative "plane"

# Again, there's no "is-a" relationship here, it should not be a child of Airport
# Also, the tests pass without subclassing, so what's the reason for it?
class AirTrafficControl
	include Weather

	attr_accessor :airport, :weather_conditions, :plane_status

	def initialize(args)
		@airport            = args[:airport]
		@weather_conditions = args[:weather_conditions]
		@plane_status       = args[:plane_status]
	end

	# These three methods don't do anything but call the 
	# airport's methods instead. This is called a "lazy class"
	# http://sourcemaking.com/refactoring/lazy-class
	def landing_clearance_for(plane)
		@airport.open_runway_for(plane)
	end

	def no_clearance_for(plane)
		@airport.close_runway_for(plane)
	end

	def weather_report(conditions)
		@weather_conditions = conditions # why set it if we get the reading from the airport anyway?
		@airport.weather_conditions
	end

	# Here we have two issues
	# Firstly, the airport and the air traffic control have two independent
	# weather variables. In some cases you rely on the air traffic control weather,
	# like in this case but on line 31 you rely on the airport's weather, which is
	# a different data source. Why have two? Only one source should be responsible
	# the weather reading.
	# Imagine a real airport with two control centers using two different weather
	# sources and having an authority to close and open the runway depending on the weather.
	# That would be a fine mess :)
	#
	# Secondly, why do we need a plane to close the runway? The runway is either closed or not,
	# depending on the weather, not on a plane.
	def close_runway_in_bad_weather(plane)
		no_clearance_for(plane) if @weather_conditions == :stormy
	end

	# A side-effect of this call is that the plane end up in the @planes array of the airport
	# You would have guessed it from the method name, which isn't good.
	def open_runway_in_good_weather(plane)
		landing_clearance_for(plane) if not @weather_conditions == :stormy
	end

end