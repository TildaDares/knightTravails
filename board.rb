class Board
  attr_reader :x_coord, :y_coord, :parent
  attr_accessor :children
  def initialize(x_coord, y_coord, parent = nil)
    @x_coord = x_coord
    @y_coord = y_coord
    @parent = parent
    @children = []
  end
end
