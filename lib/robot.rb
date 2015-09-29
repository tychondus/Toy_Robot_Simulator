class Robot
  def initialize(x = 0, y = 0, direction = 'N')
    @loc_x = x
    @loc_y = y
    @direction = direction
    @orientations = [ 'N', 'E', 'S', 'W' ]
  end

  def is_valid_direction(direction)
    index = @orientations.find_index(direction.upcase)
    index != nil ? true : false
  end 

end
