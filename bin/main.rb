require_relative 'robot_simulator'

class Main
  def initialize
  end
  
  def run
    @simulator = RobotSimulator.new

    loop = true
    while loop do
      system "clear"
      menu
      input = gets.chomp
      case input
        when "1"
          place_option
        when "2"
          left_option
        when "3"
          right_option
        when "4"
          move_option
        when "5" 
          report_option
        when "q", "Q"
          loop = false
          puts "Exiting."
        else
          puts "Invalid input. Press any key to continue."
          gets.chomp
      end
    end
  end

  def menu
    puts "#######################"
    puts "# Toy Robot Simulator #"
    puts "#######################"
    puts "1. PLACE (X,Y,F)"
    puts "2. LEFT"
    puts "3. RIGHT"
    puts "4. MOVE"
    puts "5. REPORT"
    puts "q. QUIT"
    print "Input: "
  end

  def place_option
    print "Enter X co-ordinate: "
    x = gets.chomp
    print "Enter Y co-ordinate: "
    y = gets.chomp
    print "Enter Direction (N,E,S,W): "
    dir = gets.chomp
    if @simulator.place(x.to_i, y.to_i, dir) == false
      print "Invalid input. Please try again."
      sleep 1
    else
      print "Placed robot at the following location" + 
            " (X,Y,F) (#{x},#{y},#{dir})"
      sleep 2
    end
  end

  def left_option
    if @simulator.left == false
      print "Unable to rotate left. Has the robot been placed?"
    else
      print "Rotating robot to the left."
    end
    sleep 1
  end

  def right_option
    if @simulator.right == false
      print "Unable to rotate right. Has the robot been placed?"
    else
      print "Rotating robot to the right."
    end
    sleep 1
  end
  
  def move_option
    if @simulator.move != false
      print "Moving robot in the direction its facing." 
    else
      print "Unable to move robot. Has it been placed?"
    end
    sleep 1
  end

  def report_option
    report = @simulator.report
    if report != nil
      print "\nX: #{report['x']}\n" + 
            "Y: #{report['y']}\n" + 
            "Direction: #{report['direction']}"
    else
      print "Unable to report. Has the robot been placed?"
    end
    sleep 2
  end
end

program = Main.new
program.run
