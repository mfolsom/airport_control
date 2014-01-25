require 'spec_helper'

class Today; include Weather; end

describe Weather do
	it "should be somewhat predictable" do
			today = Today.new
			expect(today.conditions).to be(:sunny)
	end

	it "should surprise everyone with random bad weather" do
		today = Today.new
		expect(today.unpredictable_conditions).to be(:stormy)
	end
end