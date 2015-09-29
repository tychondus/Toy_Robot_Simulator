class Board
  def initialize (x = 5, y = 5)
    @x_boundary = x
    @y_boundary = y
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
