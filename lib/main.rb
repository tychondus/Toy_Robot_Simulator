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
      when "2"
      when "3"
      when "4"
      when "5"
      when "q", "Q"
        loop = false
        puts "Exiting."
      else
        puts "Invalid input. Press any key to continue."
        gets.chomp
    end
  end
end
