require 'spec_helper'
require_relative '../lib/coordinate.rb'

describe Table do
  let(:robot_table) { Table.new(4, 4) }

  describe "#on_top?" do
    context "on the table" do
      it "returns true for coordinates on the table" do
        expect(robot_table.on_top?(Coordinate.new(0,0))).to be true
        expect(robot_table.on_top?(Coordinate.new(0,2))).to be true
        expect(robot_table.on_top?(Coordinate.new(2,2))).to be true
        expect(robot_table.on_top?(Coordinate.new(4,4))).to be true
      end
    end
    
    context "off the table" do
      it "returns false" do
        expect(robot_table.on_top?(Coordinate.new(-1, -1))).to be false
        expect(robot_table.on_top?(Coordinate.new(5, 5))).to be false
        expect(robot_table.on_top?(Coordinate.new(100, 100))).to be false
      end
    end
  end
end
