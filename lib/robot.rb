class Robot
  attr_accessor :loc_x, :loc_y, :direction
  attr_reader :DEFAULT_DIR, :DEFAULT_LOC

  DEFAULT_LOC = 3
  DEFAULT_DIR = 'NORTH'
  
  def initialize(x = DEFAULT_LOC, y = DEFAULT_LOC, direction = DEFAULT_DIR)
    @orientations = ['NORTH', 'EAST', 'SOUTH', 'WEST' ]
    x < 0 ? @loc_x = DEFAULT_LOC : @loc_x = x
    y < 0 ? @loc_y = DEFAULT_LOC : @loc_y = y
    is_valid_direction(direction) ? @direction = direction : @direction = DEFAULT_DIR
  end

  def is_valid_direction(direction)
    orientation_index(direction) != nil ? true : false
  end 
  
  def rotate_left
    index = orientation_index(direction) 
    index == 0 ? index = @orientations.length - 1 : index -= 1
    @direction = @orientations[index]
  end

  def rotate_right
    index = orientation_index(direction)
    index == @orientations.length - 1 ? index = 0 : index += 1
    @direction = @orientations[index]
  end
  
  private
    def orientation_index(direction)
      @orientations.find_index(direction.upcase)
    end
end
