require 'robot'

RSpec.describe Robot, "#check" do
  context "that only non negative value is accepted for x and y value during class initialiasation" do
    it "insert negative value of x and y" do
      robot = Robot.new(-1, -1)
      expect(robot.loc_x).to eq 0
      expect(robot.loc_y).to eq 0
    end
  end

  context "that only valid entry is accepted for orientation during class initialisation" do
    it "insert a value that is not N,S,E or W it should default to 'N'" do
      robot = Robot.new(2, 2, 'T')
      expect(robot.loc_x).to eq 2
      expect(robot.loc_y).to eq 2
      expect(robot.direction).to eq 'N'
    end
  end

  context "that invalid entries are not accepted for orientation" do
    it "attempt to enter an invalid character" do
      robot = Robot.new
      expect(robot.is_valid_direction('Q')).to eq false
    end
  end
end
