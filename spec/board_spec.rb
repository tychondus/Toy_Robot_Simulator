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
      expect((board.x_boundary + 1) * (board.y_boundary + 1)).to eq board.size
    end
  end

  context "board can be created with non square dimension" do
    it "specify the x and y value" do
      board = Board.new(5,7)
      expect((board.x_boundary + 1) * (board.y_boundary + 1)).to eq board.size
    end
  end

  context "if provided x and/or y values are less than 0" do
    it "if x and/or y value is less than 0 default to 5" do
      board = Board.new(-1,-1)
      expect(board.x_boundary).to_not eq -1
      expect(board.y_boundary).to_not eq -1
      expect(board.x_boundary).to eq 4
      expect(board.y_boundary).to eq 4
      expect(board.size).to eq (board.x_boundary + 1) * (board.y_boundary + 1)
    end
  end
end
