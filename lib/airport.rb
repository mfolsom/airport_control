require_relative "plane"

class Airport < Plane

	attr_accessor :plane_status, :weather_conditions

	def initialize(plane_status, weather_conditions)
		@plane_status = :plane_status
		@weather_conditions = weather_conditions
		@planes = []
	end

	def open_runway_for(plane)
		@plane_status = plane
		@planes << plane
	end

	def close_runway_for(plane)
	  return "Runway Closed!" if Plane.landing || Plane.taking_off
	end

	def has_planes?
		@planes.any?
	end

end
 