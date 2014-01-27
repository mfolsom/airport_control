require_relative "weather"

class MadScientist
	include Weather

	def random_conditions
		return RANDOM_WEATHER[4]
		super # this code will never be called because of the return
	end

	def good_conditions
		return RANDOM_WEATHER[4]
		super # this code will never be called because of the return
	end

end