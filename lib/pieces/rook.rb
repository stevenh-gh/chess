require_relative '../board'

class Rook
  attr_reader :icon, :board
  attr_accessor :pos
  def initialize(type, pos = [], board) # 0 = white, 1 = black, position in coordinates
    # "\u2656" "\u265c"
    @icon = type == 0 ? "\u2656" : "\u265c" # TODO: make module method out of this
    @pos = pos
    @board = board
  end

  # private

  # TODO: refactor this
  def get_possible_moves
    # use hash to keep track of possible moves,
    # going up, down, left, and right from pos.
    # eg: hash[left] = [array of possible moves]
    possible_moves = {}

    # get all moves from left of rook
    next_x = pos[0]
    next_y = pos[1] - 1
    left = []
    until next_y.negative?
      left << [next_x, next_y]
      next_y -= 1
    end
    possible_moves[:left] = left

    # get all moves from right of rook
    next_x = pos[0]
    next_y = pos[1] + 1
    right = []
    until next_y > 7 # TODO: using board length instead of 7?
      right << [next_x, next_y]
      next_y += 1
    end
    possible_moves[:right] = right

    # get all moves above rook
    next_x = pos[0] - 1
    next_y = pos[1]
    up = []
    until next_x.negative?
      up << [next_x, next_y]
      next_x -= 1
    end
    possible_moves[:up] = up

    # get all moves below rook
    next_x = pos[0] + 1
    next_y = pos[1]
    down = []
    until next_x > 7
      down << [next_x, next_y]
      next_x += 1
    end
    possible_moves[:down] = down

    possible_moves
  end
end
