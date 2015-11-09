#! /usr/bin/env ruby

require_relative '../lib/robot_simulator'

class Main
  
  def run
    @simulator = RobotSimulator.new 
    if ARGV.length < 1
      puts "Accepting inputs from command line. Press Ctrl+C to quit."
      menu
      print "> "
    end
    ARGF.each do |line|
      input = line.chomp
      command = input.split(' ')
      command = command[0].downcase if command[0] =~ /[a-zA-Z0-9]/
      case command
        when "move"
          move_option
        when "place"
          place_option input
        when "left"
          left_option
        when "right"
          right_option
        when "report"
          report_option
        when "menu"
          menu
        when "quit"
          puts "exiting"
          break
        else
          puts "Invalid command"
      end
      print "> "
    end
  end

  def menu
    puts "#######################"
    puts "# Toy Robot Simulator #"
    puts "#######################"
    puts "PLACE (X,Y,F)"
    puts "LEFT"
    puts "RIGHT"
    puts "MOVE"
    puts "REPORT"
    puts "QUIT"
  end

  def place_option (input=nil)
    (input.split ' ').length >= 2 ? parse_params_and_call_place(input) : get_params_and_call_place
  end

  def get_params_and_call_place
    print "Enter X co-ordinate: "
    x = gets.chomp
    print "Enter Y co-ordinate: "
    y = gets.chomp
    print "Enter Direction (NORTH,EAST,SOUTH,WEST): "
    dir = gets.chomp
    if @simulator.place([x, y, dir]) == false
      print "Invalid input. Please try again."
      sleep 1
    else
      puts "Placed robot at the following location" + 
            " (X,Y,F) (#{x},#{y},#{dir})"
      sleep 2
    end
  end

  def parse_params_and_call_place input
    method_name = (input.split ' ')[0]
    method_params = (input.split ' ')[1].split(',') #params are in index 1
    @simulator.send method_name.downcase, method_params
   
  end

  def left_option
    if @simulator.left == false
      puts "Unable to rotate left. Has the robot been placed?"
    else
      puts "Rotating robot to the left."
    end
    sleep 1
  end

  def right_option
    if @simulator.right == false
      puts "Unable to rotate right. Has the robot been placed?"
    else
      puts "Rotating robot to the right."
    end
    sleep 1
  end
  
  def move_option
    if @simulator.move != false
      puts "Moving robot in the direction its facing." 
    else
      puts "Unable to move robot. Has it been placed?"
    end
    sleep 1
  end

  def report_option
    report = @simulator.report
    if report != nil
      print "\nX: #{report['x']}\n" + 
            "Y: #{report['y']}\n" + 
            "Direction: #{report['direction']}\n"
    else
      puts "Unable to report. Has the robot been placed?"
    end
    sleep 2
  end
end

program = Main.new
program.run
