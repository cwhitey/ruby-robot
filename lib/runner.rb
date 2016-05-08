require_relative 'robot'
require_relative 'table'
require_relative 'placement'
require_relative 'coordinate'

# Instruction should be a symbol callable on robot
def run_instruction robot, instruction, *args
  robot.send(instruction, *args)
end
