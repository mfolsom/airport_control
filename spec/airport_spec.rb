require 'spec_helper'

describe Airport do
	context "airport status" do
		it "airport can be open" do
			airport = Airport.new(:open)
			expect(airport).to be_open
		end
		it "aiport can be closed" do
			airport = Airport.new(:closed)
			expect(airport).to be_closed
		end
	end
end