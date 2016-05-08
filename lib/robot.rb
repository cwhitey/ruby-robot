require_relative 'coordinate'
require_relative 'placement'

class Robot

  attr_reader :placement

  def initialize table
    @placement = Placement.new(Coordinate.new(0, 0), :north)
    @table = table
  end
end
