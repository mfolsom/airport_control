require 'spec_helper'

describe AirTrafficControl do 
	it "can tell the airport to open the runway" do
		airport = double :airport
		weather = double :weather
		tower = AirTrafficControl.new(airport, weather)
		expect(airport).to receive(:open_runway_for).with(:plane)
		tower.landing_clearance_for(:plane)
	end

	it "can tell the airport to close the runway" do
		airport = double :airport
		weather = double :weather
		tower = AirTrafficControl.new(airport,weather)
		expect(airport).to receive(:close_runway_for).with(:plane)
		tower.no_clearance_for(:plane)
	end

	it "can check the weather report" do
		airport = double :airport
		weather = double :weather
		tower = AirTrafficControl.new(airport, weather)
		expect(airport).to receive(:weather_conditions)
		tower.weather_report(weather)
	end

end

