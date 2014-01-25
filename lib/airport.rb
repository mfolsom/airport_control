require 'plane'

class Airport < Plane

	attr_accessor :airport_status, :plane_status

	def initialize(airport_status, plane_status)
		@airport_status = :airport_status
		@plane_status = :plane_status
		@planes = []
	end
	

	def open?
		open
	end

	def closed?
		closed
	end

	def open
		@airport_status = :open
	end

	def closed
		@airport_status = :closed
	end

	def open_runway_for(plane)
		@plane_status = plane
		@planes << plane
	end

	def close_runway_for(plane)
	 raise ("Runway Closed!") if Plane.landing || Plane.taking_off
	end

	def has_planes?
		@planes.any?
	end
end