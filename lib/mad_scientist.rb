require_relative "weather"

class MadScientist
	include Weather
	def random_conditions
		return RANDOM_WEATHER[4]
		super
	end
end