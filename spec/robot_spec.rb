require 'robot'

RSpec.describe Robot, "#check" do
  context "that invalid entries are not accepted for orientation" do
    it "attempt to enter an invalid character" do
      robot = Robot.new
      expect(robot.is_valid_direction('Q')).to eq false
    end
  end
end
