require_relative '../board'

class Pawn
  attr_reader :icon, :board, :type
  attr_accessor :pos, :first_move
  def initialize(type, pos = [], board) # 0 = white, 1 = black
    @icon = type == 0 ? "\u2659" : "\u265f" # TODO: make module method out of this
    @pos = pos
    @board = board.board

    @type = type # keeps track of which side is moving
    @first_move = false # to keep track whether pawn used its first move yet
  end

  def get_possible_moves
    # -a pawn can only move one spot forward
    # -on the first move however, a pawn can move
    # forward two spots.
    # -a pawn can only capture diagonally
    # -en passant: when an enemy pawn moves forward two spots
    # (pawn's first move), and lands next to your pawn (left/right)
    # you can move diagonally forward to capture that enemy pawn

    possible_moves = {}
    x = pos[0] # get x from pos
    y = pos[1] # get y from pos

    # check type of pawn, because a pawn cannot go backwards, this means that player and
    # enemy pawn has difference sets of possible moves

    # if first_move is true, then pawn can only move forward one spot
    # if first_move is false, then it means pawn has not yet moved, so it can move
    # two spots

    # white pieces are at bottom, black pieces are on at top.
    # white pawn will move x-1, while black pawn will move x+1, both y is unchanged

    # first_move = true
    # will be better to set first_move in #move

    forward = []
    if type.zero?
      forward << [x - 1, y]
      forward << [x - 2, y] unless first_move
    elsif type == 1
      forward << [x + 1, y]
      forward << [x + 2, y] unless first_move
    end

    possible_moves[:forward] = forward
  end
end
