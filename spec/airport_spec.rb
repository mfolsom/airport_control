require 'spec_helper'

describe Airport do

	let(:weather) { :sunny }

	it "airport has no planes initially" do
		# If you're testing that the airport has no planes
		# why pass Plane.flying as an argument? If you meant that 
		# the plane is in the sky and not in the airport, why
		# should the airport be aware of it?
		#
		# The problem with this way of passing data is that the next time
		# a plane approaches the airport, you have to you some other method
		# of passing it to the airport since you can initialise the airport
		# only once.
		#
		# Same applies to the weather. You're passing a symbol, a static value,
		# but this means that the airport will need to be re-initialized every
		# time we get a new weather reading. It'd be much better to use the Weather module that
		# would give new weather readings to the airport whenever it needs them.
		airport = Airport.new(Plane.flying, weather)
		expect(airport).not_to have_planes
	end

	it "has a plane once the plane has landed" do
		airport = Airport.new(Plane.landed, weather)
		airport.open_runway_for(Plane.landed)

		expect(airport).to have_planes
	end

	it "planes cannot land when the runway is closed" do
		plane   = Plane.landing
		airport = Airport.new(Plane.landing, weather)

		expect{ airport.close_runway_for(plane)}.to raise_error("Runway Closed!")
	end

	it "planes cannot take off when the runway is closed" do
		plane   = Plane.taking_off
		airport = Airport.new(Plane.taking_off, weather)

		expect{ airport.close_runway_for(plane)}.to raise_error("Runway Closed!")
	end

	it "has weather conditions" do
		airport = Airport.new(Plane.flying, weather)		
		expect(airport.weather_conditions).to eq(:sunny)
	end

end