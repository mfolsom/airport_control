require 'spec_helper'

describe Plane do 
	it "can be flying" do
		plane = Plane.new
		expect(plane).to be_flying
	end

	it "can be landing" do
		plane = Plane.new
		expect(plane).to be_landing
	end


end