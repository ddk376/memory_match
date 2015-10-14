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
