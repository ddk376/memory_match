require_relative 'board'
require_relative 'human_player'
require 'byebug'

class Game
  attr_accessor :players, :board
  attr_reader :match_num

  def initialize(size , match_num)
    # args.map! { |arg| arg.to_i }
    size_of_board = size
    @match_num = match_num
    @board = Board.new(size_of_board, @match_num).populate
    @guessed_pos = []
    @players = [HumanPlayer.new(@match_num, size_of_board),
                HumanPlayer.new(@match_num, size_of_board)]
    play
  end

  def play
    until over?
      system("clear")
      board.render
      make_guess
      switch_turn
    end
  end

  def make_guess
    match_num.times do
      loop do
        @guessed_pos << current_player.prompt
        break if !board[@guessed_pos.last].revealed?
        @guessed_pos.pop
      end
      board[@guessed_pos.last].reveal
      system("clear")
      board.render
    end
    if !@guessed_pos.all? { |pos| board[@guessed_pos.first] == board[pos] }
      sleep(3)
      @guessed_pos.each { |pos| board[pos].hide }
    end
    @guessed_pos = []
  end

  def over?
    board.won?
  end

  def current_player
    players.first
  end

  def switch_turn
    players.rotate!
  end

  private
  attr_accessor :previous_guess, :guessed_pos
  attr_reader :board
end

if __FILE__ == $PROGRAM_NAME
  size = ARGV.empty? ? 4 : ARGV.shift.to_i
  match = ARGV.empty? ? 2 : ARGV.shift.to_i
  game = Game.new(size, match)
end
