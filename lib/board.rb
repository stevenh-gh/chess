class Board
  attr_reader :board # Board.board (getter)
  def initialize
    @board = Array.new(8) { Array.new 8, ' ' } # makes a 8x8 grid
  end

  def display # prints out the grid
    # puts '   1  2  3  4  5  6  7  8' # column number
    puts '   0  1  2  3  4  5  6  7' # column number for debugging
    board.each_with_index do |arr, idx|
      # print "#{idx + 1} " # row number
      print "#{idx} " # row number for debugging
      arr.each do |ele|
        print "[#{ele == ' ' ? ele : ele.icon}]"
      end
      puts
    end
  end
end
