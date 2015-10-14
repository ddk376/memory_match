require_relative 'board'
require 'byebug'

class Game
  attr_accessor :players, :board
  attr_reader :match_num

  def initialize(size_of_board = 4, match_num = 2)
    @board = Board.new(size_of_board, match_num).populate
    @match_num = match_num
    @guessed_pos = []
    @players = [HumanPlayer.new(match_num, size_of_board),
                HumanPlayer.new(match_num, size_of_board)]
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
        guessed_pos << current_player.prompt
        break if !board[guessed_pos.last].revealed?
        guessed_pos.pop
      end
      board[guessed_pos.last].reveal
      system("clear")
      board.render
    end

    if !guessed_pos.all? {|pos| board[guessed_pos.first] != board[pos] }
      sleep(3)
      guessed_pos.each { |pos| board[pos].hide }
    end
    guessed_pos = []
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


class HumanPlayer
  attr_reader :num_of_matches, :board_size
  def initialize(num_of_matches, board_size)
    @num_of_matches = num_of_matches
    @board_size = board_size
  end

  def prompt
    puts "Guess a row and a column integer value (separated by commas)"
    get_input
  end

  def get_input
    input = gets.chomp
    if input =~ /^\d+,\d+$/
      i, j = input.split(",").map{ |el| el.to_i }
      return [i,j] if [i,j].all?{ |el| el <= board_size }
    end
    invalid_input
  end

  private
  def invalid_input
    puts "Invalid input"
    self.prompt
  end
end

class ComputerPlayer
  attr_reader :validation_check, :num_of_matches
  def intialize(num, matchcard=2)
      @num_of_matches=matchcard
  end

  def prompt
    get_input
  end

  def recieve_match(pos1, pos2)
    if @known_cards[pos1] == @known_cards[pos2]
      @matched_cards << [pos1, pos2]
    end
  end

  def get_input
    if @matched_card.length > 0
        #return known matches
    elsif #no known matches, but known_cards.length > 1
      #return a known card & a random card
      puts
    else
    i = rand(@validation_check) + 1
    j = rand(@validation_check) + 1
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
end
