class AIPlayer
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
