require 'spec_helper'

class Today; include Weather; end

describe Weather do
	it "should be somewhat predictable" do
			today = Today.new
			expect(today.conditions).to be(:sunny)
	end

	it "should surprise everyone with unpredicted bad weather" do
		today = Today.new
		expect(today.unpredicted_conditions).to be(:stormy)
	end

	it "should randomly return conditions" do
		today=Today.new
		today.stub(:random_conditions).and_return(:foggy)
		expect(today.random_conditions).to eq(:foggy)
	end
end