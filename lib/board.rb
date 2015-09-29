class Board
  def initialize
    @size = 25
    @x_boundary = Math.sqrt(@size).to_int
    @y_boundary = Math.sqrt(@size).to_int
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

  def is_valid_X(value)
    return value < @x_boundary ? true : false
  end

  def is_valid_Y(value)
    return value < @y_boundary ? true : false
  end
end
