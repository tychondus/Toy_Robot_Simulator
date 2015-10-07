require_relative 'board'
require_relative 'robot'

class RobotSimulator
  def initialize
    @board = Board.new
    @robot = Robot.new
    @placed = false
  end

  def board
    @board
  end

  def robot
    @robot
  end
  
  def is_placed
    @placed
  end

  def place(x = 5, y = 5, direction = 'N')
    board.is_valid_x(x) && board.is_valid_y(y) && robot.is_valid_direction(direction) ? 
        valid_x_and_y_values(x, y, direction) : @placed = false
  end

  def left
    is_placed ? @robot.rotate_left : false 
  end

  def right
    is_placed ? @robot.rotate_right : false 
  end

  def move
    #get the current x and y coordinate store into a variable
    move_result = calculate_movement
    #check if the new value will break the boundary
     #  if so do not proceed, return false
    #if fine, update the x and y based on the direction that it is facing
    is_within_boundary(move_result) ? update_robot_coordinates(move_result) : false
  end

  def report
    is_placed ? generate_report : nil
  end

  def generate_report
    report_hash = { 'x' => robot.loc_x,
                    'y' => robot.loc_y,
                    'direction' => robot.direction }
  end
  
  def update_robot_coordinates(move_result)
    robot.loc_x = move_result['x']
    robot.loc_y = move_result['y']
  end

  def calculate_movement
    x_move_calc = { 'W' => -1, 'E' => 1 }
    y_move_calc = { 'N' => 1, 'S' => -1 }
    x_move_calc[robot.direction] != nil ? x = robot.loc_x + x_move_calc[robot.direction] : x = robot.loc_x
    y_move_calc[robot.direction] != nil ? y = robot.loc_y + y_move_calc[robot.direction] : y = robot.loc_y
    return { 'x' => x, 'y' => y } 
  end

  def is_within_boundary( values = {'x' => nil, 'y' => nil} )
    board.is_valid_x(values['x']) && board.is_valid_y(values['y']) ? true : false
  end

  def valid_x_and_y_values(x, y, direction)
    @robot.loc_x = x
    @robot.loc_y = y
    @robot.direction = direction
    @placed = true
  end

  private :valid_x_and_y_values, :calculate_movement, :update_robot_coordinates, :is_within_boundary
end
