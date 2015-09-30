require 'robot_simulator'
require 'board'
require 'robot'

RSpec.describe RobotSimulator, "#check" do
  context "both the Board and Robot class exists" do
    it "create Board and Robot class ensure they are not nil" do
      rob_sim = RobotSimulator.new
      expect(rob_sim.board).to be_kind_of(Board)
      expect(rob_sim.robot).to be_kind_of(Robot)
    end
  end
end
