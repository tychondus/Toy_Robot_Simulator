require 'board'
require 'robot'

class RobotSimulator
  def initialize
    @board = Board.new
    @robot = Robot.new
  end

  def board
    @board
  end

  def robot
    @robot
  end
end
