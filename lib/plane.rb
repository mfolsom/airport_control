class Plane
attr_accessor :flying, :landing

	def initialize(status)
		@flying = flying
		@landing = landing
	end

	def landing
		@landing = true
	end

	def flying
		@flying = true 
	end

	def landing?
		@landing 

	end

	def flying?
		@flying 
	end	
end