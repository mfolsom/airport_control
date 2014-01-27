require_relative "plane"

# Airport should not be a subclass of Plane because there's no "is-a" relationship,
# e.g. Airport _is not_ a Plane.
# Furthermore, the tests still pass even if I remove it, so why was it needed?
class Airport

	# the plane_status is not read anywhere in this file
	# or outside it. You assign it but you don't use this data
	# at all. Why have it?
	# Also, what could it possibly mean? Airport is supposed to handle
	# multiple planes, why initialize it with just one plane status?
	attr_accessor :plane_status, :weather_conditions

	def initialize(plane_status, weather_conditions)
		@plane_status       = :plane_status
		@weather_conditions = weather_conditions
		@planes             = []
	end

	# The method name is misleading.
	# The main thing this method does is to add the plane to the array of planes
	# at the airport, meaning that the plane has landed.
	# Also, avoid returning status messages like this. Just return the plane, array or planes or even nil
	def open_runway_for(plane)
		@plane_status = plane
		@planes << plane
		return "Runway Clear!"
	end


	# This method will always raise an exception because
	# Plane.landing will return a new instance of Plane that will be
	# evaluated to true since it's neither nil nor false
	# You didn't catch this error because your test only checks that this method
	# raises an error but you should also have checked that it doesn't raise
	# an error under some conditions.
	def close_runway_for(plane)
	  raise "Runway Closed!" if Plane.landing || Plane.taking_off
	end

	def has_planes?
		@planes.any?
	end

end
 