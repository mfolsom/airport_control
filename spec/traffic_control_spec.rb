require 'spec_helper'

class Today; include Weather; end

describe AirTrafficControl do 

	it "can tell the airport to open the runway" do
		airport = double :airport
		weather = double :weather
		tower = AirTrafficControl.new(airport, weather, Plane.landing)
		expect(airport).to receive(:open_runway_for).with(:plane)
		tower.landing_clearance_for(:plane)
	end

	it "can tell the airport to close the runway" do
		airport = double :airport
		weather = double :weather
		tower = AirTrafficControl.new(airport,weather, Plane.landing)
		expect(airport).to receive(:close_runway_for).with(:plane)
		tower.no_clearance_for(:plane)
	end

	it "can check the weather report" do
		airport = double :airport
		weather = double :weather
		tower = AirTrafficControl.new(airport, weather, Plane.flying)
		expect(airport).to receive(:weather_conditions)
		tower.weather_report(weather)
	end

	it "should close the airport when weather conditions are stormy" do
		today = Today.new
		weather = today.unpredicted_conditions
		airport = Airport.new(Plane.landing, weather)
		tower = AirTrafficControl.new(airport, weather, Plane.landing)
		plane = Plane.landing
		expect(tower.close_runway_in_bad_weather(plane)).to eq("Runway Closed!")
	end

end

