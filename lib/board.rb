class Board
  attr_accessor :x_boundary, :y_boundary
  
  DEFAULT_DIMENSION = 4

  def initialize (x = DEFAULT_DIMENSION, y = DEFAULT_DIMENSION)
    x < 0 ? @x_boundary = DEFAULT_DIMENSION : @x_boundary = x
    y < 0 ? @y_boundary = DEFAULT_DIMENSION : @y_boundary = y
  end

  def is_valid_x(value)
    value >= 0 && value <= @x_boundary
  end

  def is_valid_y(value)
    value >= 0 && value <= @y_boundary
  end
end
