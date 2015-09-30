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

  context "place method is able to place the robot in a valid location" do
    it "valid x and y values" do
      rob_sim = RobotSimulator.new
      expect(rob_sim.is_placed).to eq false
      rob_sim.place(2,2,'E')
      expect(rob_sim.is_placed).to eq true
      expect(rob_sim.robot.loc_x).to eq 2
      expect(rob_sim.robot.loc_y).to eq 2
      expect(rob_sim.robot.direction).to eq 'E'
    end
  end

  context "place method rejects values that are not valid and does not place the robot" do
    it "invalid x and/or y values" do
      #invalid x value
      rob_sim = RobotSimulator.new
      expect(rob_sim.is_placed).to eq false
      rob_sim.place(6,2,'E')
      expect(rob_sim.is_placed).to_not eq true
      expect(rob_sim.robot.loc_x).to_not eq 6
      expect(rob_sim.robot.loc_y).to_not eq 2
      expect(rob_sim.robot.direction).to_not eq 'E'

      #invalid y value
      rob_sim = RobotSimulator.new
      expect(rob_sim.is_placed).to eq false
      rob_sim.place(2,6,'E')
      expect(rob_sim.is_placed).to_not eq true
      expect(rob_sim.robot.loc_x).to_not eq 2
      expect(rob_sim.robot.loc_y).to_not eq 6
      expect(rob_sim.robot.direction).to_not eq 'E'

      #invalid direction
      rob_sim = RobotSimulator.new
      expect(rob_sim.is_placed).to eq false
      rob_sim.place(2,2,'T')
      expect(rob_sim.is_placed).to_not eq true
      expect(rob_sim.robot.loc_x).to_not eq 2
      expect(rob_sim.robot.loc_y).to_not eq 2
      expect(rob_sim.robot.direction).to_not eq 'T'


    end
  end
end
