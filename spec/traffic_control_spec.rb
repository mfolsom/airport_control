require 'spec_helper'

describe AirTrafficControl do 
	it "can tell the airport to open the runway" do
		airport = double :airport
		tower = AirTrafficControl.new(airport)
		expect(airport).to receive(:open_runway_for).with(:plane)
		tower.landing_clearance_for(:plane)
	end

	it "can tell the airport to close the runway" do
		airport = double :airport
		tower = AirTrafficControl.new(airport)
		expect(airport).to receive(:close_runway_for).with(:plane)
		tower.no_clearance_for(:plane)
	end
end

