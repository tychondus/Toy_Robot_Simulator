class Robot
  DEFAULT_LOC = 0
  DEFAULT_DIR = 'N'
  def initialize(x = DEFAULT_LOC, y = DEFAULT_LOC, direction = DEFAULT_DIR)
    @orientations = ['N', 'E', 'S', 'W' ]
    x < 0 ? @loc_x = DEFAULT_LOC : @loc_x = x
    y < 0 ? @loc_y = DEFAULT_LOC : @loc_y = y
    is_valid_direction(direction) ? @direction = direction : @direction = DEFAULT_DIR
  end

  def loc_x
    @loc_x
  end

  def loc_y
    @loc_y
  end

  def direction
    @direction
  end

  def is_valid_direction(direction)
    index = @orientations.find_index(direction.upcase)
    index != nil ? true : false
  end 
  
  def rotate_left
    index = @orientations.find_index(direction.upcase)
    index == 0 ? index = @orientations.length - 1 : index -= 1
    @direction = @orientations[index]
  end

  def rotate_right
    index = @orientations.find_index(direction.upcase)
    index == @orientations.length - 1 ? index = 0 : index += 1
    @direction = @orientations[index]
  end
end
