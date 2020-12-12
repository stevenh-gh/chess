require_relative '../board'

class King
  attr_reader :icon, :board
  attr_accessor :pos
  def initialize(type, pos = [], board) # 0 = white, 1 = black
    @icon = type == 0 ? "\u2654" : "\u265a" # TODO: make module method out of this
    @pos = pos
    @board = board.board
  end

  def get_possible_moves
    # a king can only move one step to the
    # left, right, up, down
    # up left, up right, down left, and down right

    # in addition: castling.
    # castling is when the king moves two steps either
    # to the left or right towards the rook.
    # the rook then moves besides the king on its opposite side.
    # eg. if the king moves two steps towards the right rook
    # the rook then will move to the king's left side.

    # caveats: it must be both the king's and rook's first move.
    # the two steps the king takes must not put the king in check.
    possible_moves = {}
    x = pos[0]
    y = pos[1]

    left = [:left, [x, y - 1]]
    right = [:right, [x, y + 1]]
    up = [:up, [x - 1, y]]
    down = [:down, [x + 1, y]]
    up_left = [:up_left, [x - 1, y - 1]]
    up_right = [:up_right, [x - 1, y + 1]]
    down_left = [:down_left, [x + 1, y - 1]]
    down_right = [:down_right, [x + 1, y + 1]]

    [left,
     right,
     up,
     down,
     up_left,
     up_right,
     down_left,
     down_right].each { |arr| possible_moves[arr[0]] = arr[1] }

    possible_moves

    # TODO: add boundary check not just for here, but other single-step pieces
    # TODO: maybe add castling here?
  end
end
