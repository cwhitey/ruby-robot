require 'spec_helper'
require_relative '../lib/placement.rb'

describe Robot do
  let(:clumsy_robot) { Robot.new(Table.new(5, 5)) }

  describe "#initialize" do  
    it "is initialised with standard coordinates and direction" do
      expect(clumsy_robot.placement).to eq Placement.new(Coordinate.new(0,0), :north)
    end
  end
end
