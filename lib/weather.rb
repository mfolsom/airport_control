
	class Array 
		def pick_random
			self[rand(self.length)]
		end
	end

module Weather
	RANDOM_WEATHER = [:sunny, :rainy, :foggy, :drizzly, :stormy]

	def conditions
		@conditions = :sunny
	end

	def unpredicted_conditions
		@conditions = :stormy
	end

	def random_conditions
		return RANDOM_WEATHER.pick_random
	end

end