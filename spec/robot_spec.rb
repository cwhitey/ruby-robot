require 'spec_helper'
require_relative '../lib/placement.rb'

describe Robot do
  let(:clumsy_robot) { Robot.new(Table.new(5, 5)) }

  describe "#initialize" do  
    it "is initialised with standard coordinates and direction" do
      expect(clumsy_robot.placement).to eq Placement.new(Coordinate.new(0,0), :north)
    end
  end

  describe "#place" do
    it "updates placement" do
      new_placement = Placement.new(Coordinate.new(2, 2), :south)
      clumsy_robot.place new_placement
      expect(clumsy_robot.placement).to eq new_placement
    end
    
    it "doesn't update placement when invalid placement is given" do
      invalid_placement = Placement.new(Coordinate.new(100, 100), :south)
      clumsy_robot.place invalid_placement
      expect(clumsy_robot.placement).not_to eq invalid_placement
    end
  end

  describe "#right" do
    it "updates direction upon right turn" do
      expect(clumsy_robot.right).to eq :east
      expect(clumsy_robot.right).to eq :south
    end
  end

  describe "#left" do
    it "updates direction upon left turn" do
      expect(clumsy_robot.left).to eq :west
      expect(clumsy_robot.left).to eq :south
    end
  end
end
