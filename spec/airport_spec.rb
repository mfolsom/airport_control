require 'spec_helper'

describe Airport do

		it 'airport has no planes if planes are flying' do
				weather = :sunny
				airport = Airport.new(Plane.flying, weather)
				expect(airport).not_to have_planes
		end

		it 'has a plane once the plane has landed' do
				weather = :sunny
				airport = Airport.new(Plane.landed, weather)
				airport.open_runway_for(Plane.landed)
				expect(airport).to have_planes
		end

		it 'planes cannot land when the runway is closed' do
				weather = :sunny
				plane = Plane.landing
				airport = Airport.new(Plane.landing, weather)
				expect{ airport.close_runway_for(plane)}.to raise_error("Runway Closed!")
		end

		it 'planes cannot take off when the runway is closed' do
				weather = :sunny
				plane = Plane.taking_off
				airport = Airport.new(Plane.taking_off, weather)
				expect{ airport.close_runway_for(plane)}.to raise_error("Runway Closed!")
		end

		it "has weather conditions" do
				weather = :sunny
				airport = Airport.new(Plane.flying, weather)
				expect(airport.weather_conditions).to eq(:sunny)
		end

end