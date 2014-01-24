require 'spec_helper'


describe Plane do 
	it "can be landing" do
		plane = Plane.new(:landing)
		expect(plane).to be_landing
	end

	it "can be flying" do
		plane = Plane.new(:flying)
		expect(plane).to be_flying
	end

	it "can be taking off" do
		plane = Plane.new(:taking_off)
		expect(plane).to be_taking_off
	end

	it "can be landed" do
		plane = Plane.new(:landed)
		expect(plane).to be_landed
	end


end