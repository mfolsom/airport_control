require 'spec_helper'

describe Plane do 
	it "can be flying" do
		flying = :flying
		plane = Plane.new(flying)
		expect(plane).to be_flying
	end

	it "can be landing" do
		landing =(:landing)
		plane = Plane.new(landing)
		expect(plane).to be_landing
	end

	it "cannot be flying and landing at the same time" do
		landing = (:landing)
		plane = Plane.new(landing)
		expect(plane.flying?).to eq(false)
	end

end