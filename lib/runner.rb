require_relative 'robot'
require_relative 'table'
require_relative 'placement'
require_relative 'coordinate'

# Instruction should be a symbol callable on robot
def run_instruction robot, instruction, *args
  robot.send(instruction, *args)
end

def run_with_robot robot, input
  start = false
  input.read.split("\n").each do |line|
    instruction, args = line.split(" ")
    instruction = instruction.downcase.to_sym
    # Only start executing instructions when PLACE instruction is found
    if instruction == :place
      start = true
    end
    if start
      # Run instruction
      case instruction
      when :place
        args = args.split(",")
        if args.length == 3
          x, y, dir = args[0].to_i, args[1].to_i, args[2].downcase.to_sym
          run_instruction(robot, instruction, Placement.new(Coordinate.new(x, y), dir))
        end
      when :left, :right, :report, :move
        run_instruction(robot, instruction)
      end
    end
  end
end

def run input=STDIN
  run_with_robot(Robot.new(Table.new(5,5)), input)
end
