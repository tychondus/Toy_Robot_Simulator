require 'board'

RSpec.describe Board, "#check" do
  context "new x value not exceeding the prescribed dimension" do
    it "compare the given value with the limit for x co-ordinate" do
      board = Board.new
      expect(board.is_valid_X(6)).to eq false
    end
  end
  
  context "new y value not exceeding the prescribed dimension" do
    it "copmpare the given value with the limit for y co-ordinate" do
      board = Board.new
      expect(board.is_valid_Y(6)).to eq false
    end
  end

end
