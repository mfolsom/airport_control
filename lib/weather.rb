# Even though you can, don't reopen built-in classes unless you have
# a good reason to do it. Especially if there's already a method Array#shuffle
# that does exactly what pick_random does :)
	class Array 
		def pick_random
			self[rand(self.length)]
		end
	end

module Weather

RANDOM_WEATHER = [
	:sunny, :rainy, :foggy, :drizzly, :stormy,
]

	# Why have these two methods? First, they are never used by any code
	# except the test. If the Airport class doesn't need them, what's the point?
	def good_conditions
		# you don't need to use an instance variable here if you're just returning the value
		@good_conditions = :sunny
	end

	def bad_conditions
		@bad_conditions = :stormy
	end

	def random_conditions
		RANDOM_WEATHER.pick_random # sample :)
	end

end