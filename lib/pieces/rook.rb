class Rook
  attr_reader :icon
  attr_accessor :pos
  def initialize(type, pos = []) # 0 = white, 1 = black, position in coordinates
    # "\u2656" "\u265c"
    @icon = type == 0 ? "\u2656" : "\u265c" # TODO: make module method out of this
    @pos = pos
  end
end
