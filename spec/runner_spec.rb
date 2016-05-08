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

  
  # Acceptance tests
  let(:example_a) { (
%q{PLACE 0,0,NORTH
MOVE
REPORT}) }
  let(:example_a_result) { "0,1,NORTH" }
  
  let(:example_b) {
%q{PLACE 0,0,NORTH
LEFT
REPORT} }
  let(:example_b_result) { "0,0,WEST" }
  
  let(:example_c) {
%q{PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT} }
  let(:example_c_result) { "3,3,NORTH" }

  let(:extra_a) {
%q{MOVE
MOVE
LEFT
MOVE
REPORT
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT} }

  describe "#run_with_robot" do
    context "acceptance tests" do
      describe "example_a" do
        it "returns documented result" do
          s = (StringIO.new << example_a)
          s.rewind
          output = with_captured_stdout { run_with_robot robot, s}.strip
          expect(output).to eq example_a_result
        end
      end
      
      describe "example_b" do
        it "returns documented result" do
          s = (StringIO.new << example_b)
          s.rewind
          output = with_captured_stdout { run_with_robot robot, s}.strip
          expect(output).to eq example_b_result
        end
      end
      
      describe "example_c" do
        it "returns documented result" do
          s = (StringIO.new << example_c)
          s.rewind
          output = with_captured_stdout { run_with_robot robot, s}.strip
          expect(output).to eq example_c_result
        end
      end
    end

    context "no instructions are run before PLACE is found" do
      describe "extra_a" do
        it "returns same result as example_c" do
          s = (StringIO.new << extra_a)
          s.rewind
          output = with_captured_stdout { run_with_robot robot, s}.strip
          expect(output).to eq example_c_result
        end
      end
    end
  end
end
