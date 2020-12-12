require_relative '../board'

class Queen
  attr_reader :icon, :board
  attr_accessor :pos
  def initialize(type, pos = [], board) # 0 = white, 1 = black
    @icon = type == 0 ? "\u2655" : "\u265b" # TODO: make module method out of this
    @pos = pos
    @board = board.board
  end

  # TODO: what if there was opponent piece or our piece at spot?
  def move(coord)
    board[coord[0]][coord[1]] = self
  end

  def get_possible_moves
    # the queen can has the moveset of both rook and bishop
    # taken from rook.rb and bishop.rb
    possible_moves = {}
    x = pos[0]
    y = pos[1]
    # rook moves

    # get all moves from left of rook
    next_x = x
    next_y = y - 1
    left = []
    until next_y.negative?
      left << [next_x, next_y]
      next_y -= 1
    end
    possible_moves[:left] = left

    # get all moves from right of rook
    next_x = x
    next_y = y + 1
    right = []
    until next_y > 7 # TODO: using board length instead of 7?
      right << [next_x, next_y]
      next_y += 1
    end
    possible_moves[:right] = right

    # get all moves above rook
    next_x = x - 1
    next_y = y
    up = []
    until next_x.negative?
      up << [next_x, next_y]
      next_x -= 1
    end
    possible_moves[:up] = up

    # get all moves below rook
    next_x = x + 1
    next_y = y
    down = []
    until next_x > 7
      down << [next_x, next_y]
      next_x += 1
    end
    possible_moves[:down] = down

    # bishop moves
    # for each calculation, push the calculated coordinates into an array
    # calculate up left diagonal
    up_left = []
    # eg path: 3,3->2,2->1,1->0,0
    # 4,1->3,0->-2,-1
    # 2,6->1,5->0,4->-1,3
    # stop when either x or y is negative
    next_x = x - 1
    next_y = y - 1
    until next_x.negative? || next_y.negative?
      up_left << [next_x, next_y]
      next_x -= 1
      next_y -= 1
    end
    possible_moves[:up_left] = up_left

    # calculate up right diagonal
    up_right = []
    # eg path: 1,3->0,4->-1,5
    # 3,1->2,2->1,3->0,4->-1,5
    # 6,5->5,6->4,7->3,8
    # x decreases by 1, y increases by 1
    # stop when x is negative or y > 7
    next_x = x - 1
    next_y = y + 1
    until next_x.negative? || next_y > 7
      up_right << [next_x, next_y]
      next_x -= 1
      next_y += 1
    end
    possible_moves[:up_right] = up_right

    # calculate down left diagonal
    down_left = []
    # eg path: 3,6->4,5->5,4->6,3->7,2->8,1
    # 1,3->2,2->3,1->4,0->5,-1
    # stop when x > 7 or y is negative
    # x increments, y decrements
    next_x = x + 1
    next_y = y - 1
    until next_x > 7 || next_y.negative?
      down_left << [next_x, next_y]
      next_x += 1
      next_y -= 1
    end
    possible_moves[:down_left] = down_left

    # calculate down right diagonal
    down_right = []
    # eg path: 4,0->5,1->6,2->7,3->8,4
    # 2,5->3,6->4,7->5,8
    # both x and y increments
    # stop when both x and y is greater than 7
    next_x = x + 1
    next_y = y + 1
    until next_x > 7 || next_y > 7
      down_right << [next_x, next_y]
      next_x += 1
      next_y += 1
    end
    possible_moves[:down_right] = down_right

    possible_moves
  end
end
