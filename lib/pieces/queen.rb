require_relative '../board'

class Queen
  attr_reader :icon, :board
  attr_accessor :pos
  def initialize(type, pos = [], board) # 0 = white, 1 = black
    @icon = type == 0 ? "\u2655" : "\u265b" # TODO: make module method out of this
    @pos = pos
    @board = board.board
  end
end
