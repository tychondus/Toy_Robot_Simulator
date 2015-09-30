require 'board'
require 'robot'

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

  def valid_x_and_y_values(x, y, direction)
    @robot.loc_x = x
    @robot.loc_y = y
    @robot.direction = direction
    @placed = true
  end

  private :valid_x_and_y_values
end
