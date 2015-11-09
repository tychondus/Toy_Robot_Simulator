require_relative 'board'
require_relative 'robot'

class RobotSimulator
  attr_reader :board, :robot
  def initialize
    @board = Board.new
    @robot = Robot.new
    @placed = false
  end

  def is_placed
    @placed
  end

  # args[0] = x
  # args[1] = y
  # args[2] = direction
  def place(args=[robot.DEFAULT_LOC, robot.DEFAULT_LOC, robot.DEFAULT_DIR])
    formatted_args = process_args(args)
    board.is_valid_x(formatted_args[0]) && board.is_valid_y(formatted_args[1]) && 
    robot.is_valid_direction(formatted_args[2]) ? 
        valid_x_and_y_values(formatted_args) : @placed = false
  end

  def left
    is_placed ? @robot.rotate_left : false 
  end

  def right
    is_placed ? @robot.rotate_right : false 
  end

  def move
    if is_placed == true
      #get the current x and y coordinate store into a variable
      move_result = calculate_movement
      #check if the new value will break the boundary
      #  if so do not proceed, return false
      #if fine, update the x and y based on the direction that it is facing
      is_within_boundary(move_result) ? update_robot_coordinates(move_result) : false
    else
      return false
    end
  end

  def report
    is_placed ? generate_report : nil
  end

  def generate_report
    report_hash = { 'x' => robot.loc_x,
                    'y' => robot.loc_y,
                    'direction' => robot.direction }
  end

private  

  def update_robot_coordinates(move_result)
    robot.loc_x = move_result['x']
    robot.loc_y = move_result['y']
  end

  def calculate_movement
    x_move_calc = { 'WEST' => -1, 'EAST' => 1 }
    y_move_calc = { 'NORTH' => 1, 'SOUTH' => -1 }
    x_move_calc[robot.direction] != nil ? x = robot.loc_x + x_move_calc[robot.direction] : x = robot.loc_x
    y_move_calc[robot.direction] != nil ? y = robot.loc_y + y_move_calc[robot.direction] : y = robot.loc_y
    return { 'x' => x, 'y' => y } 
  end

  def is_within_boundary( values = {'x' => nil, 'y' => nil} )
    board.is_valid_x(values['x']) && board.is_valid_y(values['y']) ? true : false
  end

  def valid_x_and_y_values(args)
    @robot.loc_x = args[0].to_i
    @robot.loc_y = args[1].to_i
    @robot.direction = args[2]
    @placed = true
  end

  def process_args(args)
     args[0] = args[0].to_i if args[0].is_a? String
     args[1] = args[1].to_i if args[1].is_a? String
     return args
  end
end
