require_relative '../board'

class Knight
  attr_reader :icon, :board
  attr_accessor :pos

  def initialize(type, pos = [], board) # 0 = white, 1 = black
    @icon = type == 0 ? "\u2658" : "\u265e" # TODO: make module method out of this
    @pos = pos
    @board = board.board
  end

  def get_possible_moves
    possible_moves = {}

    x = pos[0]
    y = pos[1]

    up_left = [x - 2, y - 1]
    up_right = [x - 2, y + 1]
    down_left = [x + 2, y - 1]
    down_right = [x + 2, y + 1]
    left_up = [x - 1, y - 2]
    left_down = [x + 1, y - 2]
    right_up = [x - 1, y + 2]
    right_down = [x + 1, y + 2]

    # TODO: check for out of bounds in another method, eg Knight#check_move
    possible_moves[:up_left] = up_left
    possible_moves[:up_right] = up_right
    possible_moves[:down_left] = down_left
    possible_moves[:down_right] = down_right
    possible_moves[:left_up] = left_up
    possible_moves[:left_down] = left_down
    possible_moves[:right_up] = right_up
    possible_moves[:right_down] = right_down

    possible_moves
  end
end
