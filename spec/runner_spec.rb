require 'spec_helper'
require_relative '../lib/runner.rb'
require_relative '../lib/placement.rb'
require_relative '../lib/coordinate.rb'

describe "run instructions on robot" do
  let(:robot) { Robot.new(Table.new(5,5)) }

  describe "#run_instruction" do
    context "simple instructions with no params" do
      it "can run simple robot instructions" do
        run_instruction(robot, :move)
        output = with_captured_stdout { run_instruction(robot, :report) }.strip
        expect(output).to eq "0,1,NORTH"
      end
    end

    context "instructions with params" do
      it "can run robot instructions with params" do
        run_instruction(robot, :place, Placement.new(Coordinate.new(2, 2), :east))
        run_instruction(robot, :right)
        run_instruction(robot, :move)
        output = with_captured_stdout { run_instruction(robot, :report) }.strip
        expect(output).to eq "2,1,SOUTH"
      end
    end
  end
end
