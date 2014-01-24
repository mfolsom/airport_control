class Airport
	attr_accessor :open_or_closed
	def initialize(open_or_closed)
		@open_or_closed = :open_or_closed
	end

	def open?
		self.open_or_closed = :open
	end

	def closed?
		self.open_or_closed = :closed 
	end
end