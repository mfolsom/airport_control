require 'spec_helper'

class Today; include Weather; end

describe Weather do
it "should be somewhat predictable" do
	today = Today.new
	expect(today.conditions).to be(:sunny)

end
end