class Board
  DEFAULT_DIMENSION=5
  
  def initialize (x = DEFAULT_DIMENSION, y = DEFAULT_DIMENSION)
    x < 0 ? @x_boundary = DEFAULT_DIMENSION : @x_boundary = x
    y < 0 ? @y_boundary = DEFAULT_DIMENSION : @y_boundary = y
    @size = @x_boundary * @y_boundary
  end

  def x_boundary
    @x_boundary
  end

  def y_boundary
    @y_boundary
  end

  def size
    @size
  end

  def is_valid_x(value)
    return value < @x_boundary ? true : false
  end

  def is_valid_y(value)
    return value < @y_boundary ? true : false
  end
end
