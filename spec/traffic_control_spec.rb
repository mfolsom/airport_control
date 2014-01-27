require 'spec_helper'

class Today; include Weather; end

describe AirTrafficControl do 

	it "can tell the airport to open the runway" do
		airport = double :airport
		weather = double :weather # why have a double if it's not used at all? You could have passed nil instead
		tower   = AirTrafficControl.new(
						:airport            => airport, 
						:weather_conditions => weather, 
						:plane              => Plane.landing)

		expect(airport).to receive(:open_runway_for).with(:plane)
		tower.landing_clearance_for(:plane)
	end

	it "can tell the airport to close the runway" do
		airport = double :airport
		weather = double :weather
		tower   = AirTrafficControl.new(
						:airport            => airport,
						:weather_conditions => weather, 
						:plane              => Plane.landing)

		expect(airport).to receive(:close_runway_for).with(:plane)
		tower.no_clearance_for(:plane)
	end

	it "can check the weather report" do
		airport = double :airport
		weather = double :weather
		tower   = AirTrafficControl.new(
						:airport            => airport, 
						:weather_conditions => weather, 
						:plane              => Plane.flying)

		expect(airport).to receive(:weather_conditions)
		tower.weather_report(weather)
	end

	it "stops planes from landing and close the airport during stormy weather" do
		today   = Today.new
		weather = today.bad_conditions
		airport = Airport.new(Plane.landing, weather)
		plane   = Plane.landing
		tower   = AirTrafficControl.new(
						:airport            => airport, 
						:weather_conditions => weather, 
						:plane              => plane)

		expect{tower.close_runway_in_bad_weather(plane)}.to raise_error("Runway Closed!")
	end
	
	it "should also stop planes from taking off during stormy weather" do
		today   = Today.new
		weather = today.bad_conditions
		# instead of the previous line you could have done
		# double :weather, :conditions => :bad
		# then you class would call weather.conditions and get the correct reading
		airport = Airport.new(Plane.taking_off, weather)
		plane   = Plane.taking_off
		tower   = AirTrafficControl.new(
						:airport             => airport,
						:weather_conditions  => weather,
						:plane               => plane)

		expect{tower.close_runway_in_bad_weather(plane)}.to raise_error("Runway Closed!")
	end

	it "clears the runway for landing in good weather" do
		today   = Today.new
		plane   = Plane.landing
		weather = today.good_conditions
		airport = Airport.new(plane, weather)
		tower   = AirTrafficControl.new(
						:airport            => airport, 
						:weather_conditions => weather, 
						:plane              => plane)

		expect(tower.open_runway_in_good_weather(plane)).to eq("Runway Clear!")
	end

	context "*************WOOHAHAHAH!!*************" do

		it "when the mad scientist takes over the weather the tower closes the runway and planes can't land" do
			today         = Today.new
			mad_scientist = MadScientist.new # you don't need a mad scientist, you need weather double that returns what you need :)
			weather       = mad_scientist.random_conditions
			plane         = Plane.landing
			airport       = Airport.new(plane, weather)
			tower         = AirTrafficControl.new(
				            :airport            => airport, 
				            :weather_conditions => weather, 
				            :plane              => plane)
			# why would you expect an error here? It's a perfectly normal situation:
			# weather is bad, runway is closed, happens all the time.
			# Exceptions should be used if something that shouldn't have happened takes place
			expect{tower.close_runway_in_bad_weather(plane)}.to raise_error("Runway Closed!")
		end

	end

end

