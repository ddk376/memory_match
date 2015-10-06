require_relative 'card'
class Board
  attr_reader :size

  def initialize(size = 4)
    size = 99 if size > 99
    @grid = Array.new(size) {Array.new(size)}
    @size = size
    populate
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def populate
    num_of_pairs = (size ** 2) / 2
    all_cards = Card.create_deck(num_of_pairs)

    shuffled_cards = all_cards.shuffle

    shuffled_cards.each do |shuffled_card|
      size.times do |i|
        size.times do |j|
          @grid[i][j] = shuffled_cards.pop
        end
      end
    end
  end

  def render
    print "   "
    size.times do |coord|
      print "%3s" % coord
    end
    puts
    (0..(size - 1)).each do |i|
      print "%3s" % i.to_s
      (0..(size - 1)).each { |j| print "%3s" % "#{@grid[i][j].to_s}" }
      puts
    end
  end

  def won?
    @grid.flatten.all? { |card| card.revealed? }
  end

  def reveal(guessed_pos)  #guessed_pos = [i,j]
    @grid[guessed_pos].reveal
  end

  def hide(guessed_pos)
    @grid[guessed_pos].hide
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new(22)
  board.render
end
