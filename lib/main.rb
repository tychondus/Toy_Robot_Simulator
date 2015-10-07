require_relative 'robot_simulator'

class Main
  simulator = RobotSimulator.new

  loop = true
  dir_list = ['N','E','S','W']
  while loop do
    system "clear"
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
    input = gets.chomp
    case input
      when "1"
        print "Enter X co-ordinate: "
        x = gets.chomp
        print "Enter Y co-ordinate: "
        y = gets.chomp
        print "Enter Direction (N,E,S,W): "
        dir = gets.chomp
        if simulator.place(x.to_i, y.to_i, dir) == false
          print "Invalid input. Please try again."
          sleep 1
        else
          print "Placed robot at the following location" + 
                " (X,Y,F) (#{x},#{y},#{dir})"
          sleep 2
        end
      when "2"
        if simulator.left == false
          print "Unable to rotate left. Has the robot been placed?"
          sleep 1
        else
          print "Rotating robot to the left."
          sleep 1
        end
      when "3"
        if simulator.right == false
          print "Unable to rotate right. Has the robot been placed?"
          sleep 1
        else
          print "Rotating robot to the right."
          sleep 1
        end
      when "4"
      when "5" 
       report = simulator.report
       if report != nil
          print "\nX: #{report['x']}\n" + 
                "Y: #{report['y']}\n" + 
                "Direction: #{report['direction']}"
        else
          print "Unable to report. Has the robot been placed?"
        end
        sleep 2
      when "q", "Q"
        loop = false
        puts "Exiting."
      else
        puts "Invalid input. Press any key to continue."
        gets.chomp
    end
  end
end
