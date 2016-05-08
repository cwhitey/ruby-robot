require_relative 'coordinate'
require_relative 'placement'

class Robot

  attr_reader :placement

  # Mappings of [current direction] -> [next direction] for turning different ways
  @@left_map = {:north => :west, :west => :south, :south => :east, :east => :north}
  @@right_map = {:north => :east, :east => :south, :south => :west, :west => :north}
  
  def initialize table
    @placement = Placement.new(Coordinate.new(0, 0), :north)
    @table = table
  end

  def place placement
    @placement = placement if @table.on_top?(placement[:coordinate])
  end
  
  def right
    mapping = @@right_map[@placement[:dir]]
    @placement[:dir] = mapping if mapping
  end
  
  def left
    mapping = @@left_map[@placement[:dir]]
    @placement[:dir] = mapping if mapping
  end
end
