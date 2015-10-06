require "memory.rb"

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  board.populate
  puts board.grid
end
