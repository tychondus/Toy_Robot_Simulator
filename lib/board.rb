class Board
  DEFAULT_DIMENSION=4
  attr_accessor :x_boundary, :y_boundary
  
  def initialize (x = DEFAULT_DIMENSION, y = DEFAULT_DIMENSION)
    x < 0 ? @x_boundary = DEFAULT_DIMENSION : @x_boundary = x
    y < 0 ? @y_boundary = DEFAULT_DIMENSION : @y_boundary = y
  end

  def is_valid_x(value)
    return value >= 0 && value <= @x_boundary ? true : false
  end

  def is_valid_y(value)
    return value >= 0 && value <= @y_boundary ? true : false
  end
end
