class Plane
attr_accessor :state
def initialize(state)
	@state = state
end

def landing?
	self.state = :landing
end

def flying?
	self.state = :flying
end

def landed?
	self.state = :landed
end

end