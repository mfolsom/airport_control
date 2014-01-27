# You overcomplicated things a little bit.
# Why have four states for the plane if you could have had only two: flying and landed?
# It would have been ok if the Airport class made more sense, though.
class Plane
	
	attr_accessor :status

	def initialize(status = nil)
		@status= status
	end

	def landing?
		@status == :landing
	end

	def self.landing
		self.new(:landing)
	end

	def flying?
		@status == :flying
	end

	def self.flying
		self.new(:flying)
	end

	def taking_off?
		@status == :taking_off
	end
	def self.taking_off
		self.new(:taking_off)
	end

	def landed?
		@status == :landed
	end

	def self.landed
		self.new(:landed)
	end

end