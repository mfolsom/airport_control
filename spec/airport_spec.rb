require 'spec_helper'

describe Airport do

	context "airport status" do
		it "airport can be open" do
			airport = Airport.new(:open, Plane.flying)
			expect(airport).to be_open
		end

		it "aiport can be closed" do
			airport = Airport.new(:closed, Plane.flying)
			expect(airport).to be_closed
		end

		it 'has no planes' do
			airport = Airport.new(:open, Plane.flying)
			expect(airport).not_to have_planes
		end


		it 'has a plane once the plane landed' do
			airport = Airport.new(:open, Plane.landed)
			airport.open_runway_for(Plane.landed)
			expect(airport).to have_planes
		end

			it 'planes cannot land when the runway is closed' do
				plane = Plane.landing
				airport = Airport.new(:closed, Plane.landing)
				expect { airport.close_runway_for(plane) }.to raise_error("Runway Closed!")
		end

			it 'planes cannot take off when the runway is closed' do
				plane = Plane.taking_off
				airport = Airport.new(:closed, Plane.taking_off)
				expect { airport.close_runway_for(plane) }.to raise_error("Runway Closed!")
		end

	end

end