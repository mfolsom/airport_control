require 'spec_helper'

describe MadScientist do 

	context "****The Mad Scientist has harnessed the random weather patterns****" do
	context "****(known as the random weather generator in this code-verse).****" do
	context "****He is now planning nefarious interference with the inhabitants of the code-verse:****" do

		it "He has the power to make the weather stormy all the time" do
			mad_scientist = MadScientist.new
			expect(mad_scientist.random_conditions).to eq(:stormy)
			expect(mad_scientist.good_conditions).to eq(:stormy)
		end
	
	end
	end
	end
end