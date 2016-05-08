require_relative 'grid'

class Table
  def initialize x_max, y_max
    @grid = Grid.new(x_max, y_max)
  end

  def on_top? coordinate
    @grid.includes? coordinate
  end
end
