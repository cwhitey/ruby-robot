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

  describe "#move" do
    it "moves forward in one direction" do
      # Move north one step
      clumsy_robot.move
      expect(clumsy_robot.placement[:coordinate]).to eq Coordinate.new(0, 1)
      clumsy_robot.move
      expect(clumsy_robot.placement[:coordinate]).to eq Coordinate.new(0, 2)
    end

    it "moves after direction has changed" do
      clumsy_robot.right
      # Move east
      clumsy_robot.move
      expect(clumsy_robot.placement[:coordinate]).to eq Coordinate.new(1, 0)
    end

    it "doesn't move off the table" do
      clumsy_robot.right
      clumsy_robot.right
      # Try to move south (off the table)
      clumsy_robot.move
      expect(clumsy_robot.placement[:coordinate]).to eq Coordinate.new(0, 0)
    end
  end
  
  describe "#report" do
    context "default initialized robot" do
      it "outputs report" do
        output = with_captured_stdout { clumsy_robot.report }.strip
        expect(output).to eq "0,0,NORTH"
      end
    end

    context "adventurous robot" do
      it "outputs accurate report" do
        clumsy_robot.right
        clumsy_robot.move
        output = with_captured_stdout { clumsy_robot.report }.strip
        expect(output).to eq "1,0,EAST"
        clumsy_robot.left
        clumsy_robot.move
        output = with_captured_stdout { clumsy_robot.report }.strip
        expect(output).to eq "1,1,NORTH"
      end
    end
  end
end
