require_relative 'coordinate'

class Table
  def initialize x_max, y_max
    @coord = Coordinate.new(x_max, y_max)
  end

  def on_top? coordinate
    (0..@coord[:x]).include?(coordinate[:x]) && (0..@coord[:y]).include?(coordinate[:y])
  end
end
