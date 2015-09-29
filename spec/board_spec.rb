require 'board'

RSpec.describe Board, "#check" do
  context "new x value not exceeding the prescribed dimension" do
    it "compare the given value with the limit for x co-ordinate" do
      board = Board.new
      expect(board.is_valid_x(6)).to eq false
    end
  end
  
  context "new y value not exceeding the prescribed dimension" do
    it "compare the given value with the limit for y co-ordinate" do
      board = Board.new
      expect(board.is_valid_y(6)).to eq false
    end
  end

  context "X and Y value to ensure that they match size" do
    it "multiply x_boundary and y_boundary and verify it with size" do
      board = Board.new
      expect(board.x_boundary * board.y_boundary).to eq board.size
    end
  end

  context "board can be created with non square dimension" do
    it "specify the x and y value" do
      board = Board.new(5,7)
      expect(board.x_boundary * board.y_boundary).to eq board.size
    end
  end
end
