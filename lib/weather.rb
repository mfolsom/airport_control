
	class Array 
		def pick_random
			self[rand(self.length)]
		end
	end

module Weather

RANDOM_WEATHER = [
	:sunny, :rainy, :foggy, :drizzly, :stormy,
]

	def good_conditions
		@good_conditions = :sunny
	end

	def bad_conditions
		@bad_conditions = :stormy
	end

	def random_conditions
		return RANDOM_WEATHER.pick_random
	end

end