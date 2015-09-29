require 'board'

RSpec.describe Board, "#something" do
  context "something" do
    it "" do
      board = Board.new
      board.boundary = 5
      expect(board.is_valid_X(6)).to eq false
    end
  end
end
