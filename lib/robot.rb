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

  def move
    new_place = move_prep
    @placement = new_place if @table.on_top? new_place[:coordinate]
  end

  def report
    coord = @placement[:coordinate]
    puts "#{coord[:x]},#{coord[:y]},#{@placement[:dir].to_s.upcase}"
  end
  
  private

  def move_prep
    coord = @placement[:coordinate]
    dir = @placement[:dir]
    case dir
    when :north
      Placement.new(Coordinate.new(coord[:x], coord[:y] + 1), dir)
    when :east
      Placement.new(Coordinate.new(coord[:x] + 1, coord[:y]), dir)
    when :south
      Placement.new(Coordinate.new(coord[:x], coord[:y] - 1), dir)
    when :west
      Placement.new(Coordinate.new(coord[:x] - 1, coord[:y]), dir)
    end
  end
end
