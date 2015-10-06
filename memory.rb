require_relative 'card'
require_relative 'board'
require 'byebug'

class Game
  attr_reader :board
  attr_accessor :players

  def initialize(size_of_board = 4)
    @board = Board.new(size_of_board).populate
    @previous_guess = nil
    @guessed_pos = nil
    @players = [HumanPlayer.new(matches), HumanPlayer.new(matches)]
    play
  end

  def play
    while !@board.won?
      system("clear")
      @board.render
      make_guess
      switch_turn
    end
  end


  def make_guess
    current_player.prompt

    result = false
    values = []
    @matches_arr.each do |match|  #@matches_arr = [[a,b], [c,d]]
      values << @board.reveal(match)
      tell_computerplayer(@player2, match, @board.reveal(match))
    end
    @board.render
    sleep(3)
    result = true if values.uniq.length == 1

    if !result   # all are not matching
      @matches_arr.each {|match| @board.hide(match)}
    end

    @previous_guess = @matches_arr
    @matches_arr = []

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

  # def tell_computerplayer(player, match, value)  # match [i,j] value= vlaue of card at [i,j]
  #   if player.is_a?(ComputerPlayer)
  #     player.receive_revealed_card(match, value)
  #   end
  # end
end


class HumanPlayer
  attr_reader :validation_check, :num_of_matches
  def initialize(num,matchcard=2)
    @num_of_matches = matchcard
    @validation_check = num
  end

  def prompt
    puts "Guess a row and a column integer value (separated by commas)"
    get_input
  end

  def get_input
    input = gets.chomp
    position = input.split(",")
    i = position[0].to_i
    j = position[1].to_i

    if (1..@validation_check).include?(i) && (1..@validation_check).include?(j)
      return [i,j]
    else
      prompt
    end

  end

end

class ComputerPlayer
  attr_reader :validation_check, :num_of_matches
  def intialize(num, matchcard=2)
      @num_of_matches=matchcard
      @validation_check = num
      @known_cards = {}
      @matched_cards = []
  end

  def recieved_revealed_card(match, value)
    @known_cards[match] = value
    @known_cards.each do |key, value|
      @known_cards.each do |key2, value2|
        if key != key2
          recieve_match(key,key2)
        end
      end
    end
    #go through all known cards and see if there are any values to put into @matched_cards
  end

  def prompt
    puts "Guess a row and a column integer value"
    get_input
  end

  def recieve_match(pos1, pos2)
    if @known_cards[pos1] == @known_cards[pos2]
      @matched_cards << [pos1, pos2]
    end
  end

  def get_input
    #go through known_cards and delete all face up cards

    if @matched_card.length > 0
        #return known matches
    elsif #no known matches, but known_cards.length > 1
      #return a known card & a random card
      puts
    else
    i = rand(@validation_check) + 1
    j = rand(@validation_check) + 1
    end

      if (1..@validation_check).include?(i) && (1..@validation_check).include?(j)
        return [i,j]
      else
        prompt
      end
  end

end



if __FILE__ == $PROGRAM_NAME
  game = Game.new
end
