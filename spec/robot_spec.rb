require 'robot'

RSpec.describe Robot, "#check" do
  context "that only non negative value is accepted for x and y value during class initialiasation" do
    it "insert negative value of x and y" do
      robot = Robot.new(-1, -1)
      expect(robot.loc_x).to_not eq -1
      expect(robot.loc_y).to_not eq -1
    end
  end

  context "that only valid entry is accepted for orientation during class initialisation" do
    it "insert a value that is not N,S,E or W it should default to 'N'" do
      robot = Robot.new(2, 2, 'T')
      expect(robot.loc_x).to eq 2
      expect(robot.loc_y).to eq 2
      expect(robot.direction).to_not eq 'T'
      expect(robot.direction).to eq 'NORTH'
    end
  end

  context "that invalid entries are not accepted for orientation" do
    it "attempt to enter an invalid character" do
      robot = Robot.new
      expect(robot.is_valid_direction('Q')).to eq false
    end
  end

  context "that robot rotates 90 degrees to the left when method is called" do
    it "call the rotate_left method and expect that robot rotates 90 degree to the left" do
      robot = Robot.new
      robot.rotate_left
      expect(robot.direction).to eq 'WEST'
      robot.rotate_left
      expect(robot.direction).to eq 'SOUTH'
      robot.rotate_left
      expect(robot.direction).to eq 'EAST'
      robot.rotate_left
      expect(robot.direction).to eq 'NORTH'
      robot.rotate_left
      expect(robot.direction).to eq 'WEST'
    end
  end

  context "that robot rotates 90 degrees to the right when method is called" do
    it "call the rotate_right method and expect that robot rotates 90 degree to the right" do
      robot = Robot.new
      robot.rotate_right
      expect(robot.direction).to eq 'EAST'
      robot.rotate_right
      expect(robot.direction).to eq 'SOUTH'
      robot.rotate_right
      expect(robot.direction).to eq 'WEST'
      robot.rotate_right
      expect(robot.direction).to eq 'NORTH'
      robot.rotate_right
      expect(robot.direction).to eq 'EAST'
    end
  end
end
