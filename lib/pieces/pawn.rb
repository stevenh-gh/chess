require_relative '../board'

class Pawn
  attr_reader :icon, :board
  attr_accessor :pos
  def initialize(type, pos = [], board) # 0 = white, 1 = black
    @icon = type == 0 ? "\u2659" : "\u265f" # TODO: make module method out of this
    @pos = pos
    @board = board.board
  end
end
